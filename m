Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B11C001CC
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvneUqZfd27xdH7i7ElGM/qtZ3lKBc7X3RH0Dlr3png=; b=npoGXtqEmSMZ9MOPjAEvqTFuJJ
	L5PseAWJ0/gUJ5084Z/i5lAVbXbNNFdGVLM9wKLPm01jNe2fH+CPP9QJvo+56leLPzRyru+v+76CZ
	GlP91Mg4uhKEXSKFy5TwhpWL7Vph+cpPbknuisSerV68mtPHm4XEq4KuLb0DXGLII7X8DohU/y7Bn
	tObSGxgJsNTKN9GpmgWhCnrAuFC2jmpwSKNBRzcYjeZxPzBsnjskRZjTmKJoBAP15HvP84Pfmjc3q
	zaGU3g3i8nknMZtzJrxqOjDRTpNgLbMi3nMJafpI0xQAFl9yMQEs/VXOEI5tgBhR08kRnZRn36VFl
	KtPIjjDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruvir-0000000CYfY-2S0w;
	Thu, 11 Apr 2024 14:48:17 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruugL-0000000CE8s-0vNJ;
	Thu, 11 Apr 2024 13:41:48 +0000
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56c5d05128dso8896230a12.0;
        Thu, 11 Apr 2024 06:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712842894; x=1713447694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvneUqZfd27xdH7i7ElGM/qtZ3lKBc7X3RH0Dlr3png=;
        b=aqD44Q0PKyJu4VvZkXghnfqftJAjtqmBkXKKK7pxdO2ISQLslZF/vo7QfHTHd3IHxJ
         nLaxTC2r30tqLb0GJeHkuruigr1+Aq+mSfGz9ekTRRDK4wqnxIxTecOOHcfXbaI4QwbU
         R07A52bIE5Z9vXfhHp4kwQfb5E0CJ/0u/JLDFD0O2jIQaOpKQzUUgRg24QL/4z0Zu/En
         1fFxzsA8Xkqoe+3axj/ZHRRx7Tfd6dEFIQXPnTeHhMVTcF5v9QQXmJj4ABgo5wtAUXzU
         rYgab2G2FuJVkzzHR5RebP4d1Qt3HsSW0Q/w6mJ5MPHT8KB9sNIThmAMG5ZfvVsAAnqj
         Jmkg==
X-Forwarded-Encrypted: i=1; AJvYcCUI91mMhmbxrhg3J8DBNgGjMPjtkLArE+SwPUC4TV2YsQvKcaK2NHRqUBeBKiz6or0SsoJ8N8ws65+0Tlik4PmWIpBeGmBxqh8pdWRzxeDlTnvSwFg8jFbrQWB6To7WngCq34Sr5DM6ActCvghP8FGVoOInNsomcXvuANdgxosEtyVB0Ka8gMbK4D2gcsbCvexB3RKuWNk8Nn/s5KDrXLexG90krIVa+fAoKwmtSgHThA==
X-Gm-Message-State: AOJu0YyKpqk/Xni7i56oygRRvIYzgmTU+v/5Qk8eJ/n2d99YITREAw5d
	4IxlSslyywqJuspH8DqJfnYqxDoJjJl2H4k6OXcTsGSimY3z7fDe
X-Google-Smtp-Source: AGHT+IFVHCivSmrCJQ/y1EgrRPUwWuulRGSKey7Ag7Jr1OrzqAwr6UvPSa7kMM+1w1xBFvGGvQGbng==
X-Received: by 2002:a50:8e15:0:b0:56f:e4f7:fbd9 with SMTP id 21-20020a508e15000000b0056fe4f7fbd9mr1606203edw.20.1712842894052;
        Thu, 11 Apr 2024 06:41:34 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-004.fbsv.net. [2a03:2880:30ff:4::face:b00c])
        by smtp.gmail.com with ESMTPSA id j1-20020aa7de81000000b0056e62321eedsm706414edv.17.2024.04.11.06.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 06:41:33 -0700 (PDT)
Date: Thu, 11 Apr 2024 06:41:30 -0700
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: aleksander.lobakin@intel.com, davem@davemloft.net, pabeni@redhat.com,
	edumazet@google.com, elder@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, nbd@nbd.name,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org, taras.chornyi@plvision.eu,
	ath11k@lists.infradead.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, geomatsi@gmail.com,
	kvalo@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	quic_jjohnson@quicinc.com, leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org, idosch@idosch.org
Subject: Re: [PATCH net-next v5 00/10] allocate dummy device dynamically
Message-ID: <Zhfoim8HbQGlvbAC@gmail.com>
References: <20240410131407.3897251-1-leitao@debian.org>
 <20240411060926.308788bf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411060926.308788bf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_064137_608614_C1713D39 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 11, 2024 at 06:09:26AM -0700, Jakub Kicinski wrote:
> On Wed, 10 Apr 2024 06:13:41 -0700 Breno Leitao wrote:
> >   wifi: ath11k: allocate dummy net_device dynamically
> 
> Sorry Breno, I didn't notice earlier, patch 10 didn't make it
> to the list. The series wasn't ingested by CI and tested because 
> of this. Could you repost?

Thanks for the heads-up. I debugged it and it was my mistake, this is
how I've sent it.

	git send-email patches/v5-000*

I will repost.

