Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1164ACD128A
	for <ath11k@archiver.kernel.org>; Mon,  8 Apr 2024 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+5wDrVmPRuIiSwBrRmVT0PS58QAkfRbs3RzHuiSDAI=; b=LR+2WkaFKRpKcpATRcbBwVp3w0
	nW085IFDgbMMy6lukVYLmWWpaVupk8HzAtAznxCI7Ad9aTKI5PFIeACZpVtjBbsD3VgsPNSx9xQUq
	Pas7fDlWnA+8uyGfEeCGHBMsOsGE6BQNJOLYt8dmqhp2RdzQz2jvxEKUQyTbxszfSw4S2XuvXEhnc
	ilz3jpHIJQtauUtP+Tzl6pbC6nB0vYNxZYTJ8/8lo+tgqRR4l3KP6gfAK304GGJLqGuki5Ab4KM1U
	pF41j119XPO3HUN/l4gl2b6ed1b0zWLtDbKlVfSrMGYlPX+hdpYdktDOxfN4D/vhgzMz7O12rvoBf
	OQDRHIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtp8Y-0000000Fjie-3e6o;
	Mon, 08 Apr 2024 13:34:14 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtp8U-0000000FjfK-19qu;
	Mon, 08 Apr 2024 13:34:13 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a44ad785a44so525932266b.3;
        Mon, 08 Apr 2024 06:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712583239; x=1713188039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+5wDrVmPRuIiSwBrRmVT0PS58QAkfRbs3RzHuiSDAI=;
        b=nz+DsuNcBruYxRGaRfxjR6H7ffu8ZXma3ExRkgKYl4ubT9cOapAb8wRRGoxxpUGvZI
         3VRmofLb6TtTHxKfQJITFzvsG7th2jgSQNB8CMb1hchiB6a8OIdnoIQo7snsR4SSkH5p
         F6ciriX/i5fL6u3SVgQBV6DmlKNHdwAW8X8ndduI25j6+JFqb1nlT/O1R9OHu9a8Iqrt
         SbUCzVMrgVXu5jgx63F5Sch160rDAhYEzRDVbLmZjQwe2vbPoYiMfDREwVE9CgsCa4M1
         2BNShmyhOxu0D9gglnlgh+Frr8uk/qJW4dcReSRIViOy0UNirD4R4hKPzXQsbj3eoBsY
         bsTg==
X-Forwarded-Encrypted: i=1; AJvYcCWc2nXaq3IYMgKAfr3Q3sC7PTX9PBfHR2KOsC4XDeuy+hGsPa7wuHPGRZ5gz3hIo3HY5i9U+J3jj3qypw+juLXc+/VrnpcZgvNx8Qm4WgfgjMb/MD7BblAF9VrOCBqGd2RPHrY+pGc=
X-Gm-Message-State: AOJu0YxIlF4YYHr82WO4vQsCTmXxSy3YfIy8PiuhQQGe/SdHnu4mpB/Y
	1CnJxYWpO+S0zw18gLniS8zimNzuGDLqQWv8uDaMFR3jd7TRwEJY
X-Google-Smtp-Source: AGHT+IFG1A/aXSJF1vs3BAnXmRfhA0B3vs71mMEuEDjURn9PVqQkXpJtMGYAvgXIPvupcCdvOEeZ3Q==
X-Received: by 2002:a17:907:d8a:b0:a51:ce92:1e1b with SMTP id go10-20020a1709070d8a00b00a51ce921e1bmr3195308ejc.72.1712583239288;
        Mon, 08 Apr 2024 06:33:59 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-008.fbsv.net. [2a03:2880:30ff:8::face:b00c])
        by smtp.gmail.com with ESMTPSA id s21-20020a170906355500b00a51da296f66sm1035902eja.41.2024.04.08.06.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 06:33:59 -0700 (PDT)
Date: Mon, 8 Apr 2024 06:33:56 -0700
From: Breno Leitao <leitao@debian.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: kuba@kernel.org, ath11k@lists.infradead.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, imitsyanko@quantenna.com,
	geomatsi@gmail.com, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 0/3] wifi: Un-embed ath10k and ath11k dummy netdev
Message-ID: <ZhPyRHHlVot+a8Xq@gmail.com>
References: <20240405122123.4156104-1-leitao@debian.org>
 <87y19r264m.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y19r264m.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_063410_767936_4D4D28B4 
X-CRM114-Status: GOOD (  21.49  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello Kalle,

On Fri, Apr 05, 2024 at 06:15:05PM +0300, Kalle Valo wrote:
> Breno Leitao <leitao@debian.org> writes:
> 
> > struct net_device shouldn't be embedded into any structure, instead,
> > the owner should use the private space to embed their state into
> > net_device.
> >
> > This patch set fixes the problem above for ath10k and ath11k. This also
> > fixes the conversion of qtnfmac driver to the new helper.
> >
> > This patch set depends on a series that is still under review:
> > https://lore.kernel.org/all/20240404114854.2498663-1-leitao@debian.org/#t
> >
> > If it helps, I've pushed the tree to
> > https://github.com/leitao/linux/tree/wireless-dummy
> >
> > PS: Due to lack of hardware, unfortunately all these patches are
> > compiled tested only.
> >
> > Breno Leitao (3):
> >   wifi: qtnfmac: Use netdev dummy allocator helper
> >   wifi: ath10k: allocate dummy net_device dynamically
> >   wifi: ath11k: allocate dummy net_device dynamically
> 
> Thanks for setting up the branch, that makes the testing very easy. I
> now tested the branch using the commit below with ath11k WCN6855 hw2.0
> on an x86 box:
> 
> 5be9a125d8e7 wifi: ath11k: allocate dummy net_device dynamically
> 
> But unfortunately it crashes, the stack trace below. I can easily test
> your branches, just let me know what to test. A direct 'git pull'
> command is the best.

Thanks for the test.

Reading the issue, I am afraid that freeing netdev explicitly
(free_netdev()) might not be the best approach at the exit path.

I would like to try to leverage the ->needs_free_netdev netdev
mechanism to do the clean-up, if that makes sense. I've updated the
ath11k patch, and I am curious if that is what we want.

Would you mind testing a net patch I have, please?

  https://github.com/leitao/linux/tree/wireless-dummy_v2

PS: I didn't updated the other drivers (ath10k, qtnfmac, etc).

Thank you!

