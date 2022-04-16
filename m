Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B44C433EF
	for <ath11k@archiver.kernel.org>; Sat, 16 Apr 2022 01:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySbCSkJ7nHoY6CJyRZRWGs2EjV2l27I+F+hrLLmZrwY=; b=PWKJFp2tXJDym5
	g350g6Lr4GkPEToXXFw6Z6RtV25JfYKZGSssltX4XkdRsZKKOqsCjdHgqk2Kbhk9sq4KNposT5MN0
	xRRQLVhOfY14MV9A/aom3GvvE+BcGTOfNu2577FbaY+ErDerpUj8MKDcnVpgQAZ/dEsFudtyvaQn5
	p1Ec43XIGMxFjv/+TUamVdiWTms9KL3lbKg0VU9TyyVi0tI78HdCexbefkQsVt5/g/2E5r5uUV7C+
	X/UIBPT25i07Ptrk1HgPGn/wlpsIfWpcsqL7uwJ78dQE/ZXE+2dVYqZxxDTtQPjgAr1ICgZoP9QhC
	dls+xB8gqNIh7itS9bjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfXaU-00Bujs-0u; Sat, 16 Apr 2022 01:50:58 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfXaQ-00BujT-UA
 for ath11k@lists.infradead.org; Sat, 16 Apr 2022 01:50:56 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so9539688pjk.4
 for <ath11k@lists.infradead.org>; Fri, 15 Apr 2022 18:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CZl1G0yOWcHR+4w7BioZbnZEDnrT5AWLArVFooO2o4c=;
 b=D5xuKdFnExTDBQqGU6R+W9iBOJpgg5vTWz80N32DLEL+l8fWuCwxG0MVcgkEwFH7RW
 YvkGiShTxKYq2hXm+RWPdnsD6DLANCncDhkkitJ9shRjRuHTzU8q6hyWi1WbXnZAR2TZ
 evkw8KDtAyW9Zr3GMDBwD7RLvmc2Y9f7bznv649G1+oIzcWr/WP3E4T96M8KiNQ9Tqan
 CusSHAAqLghyE6N8VPTqmRNKvIGPefCOr2mLmjhUs1uUG0N/faddOvgUzzHSOJXBwzNi
 c0t0wfXtojBK6O41quttPCM+v96WGPpztgmcEjzGZ2JQwXccwOo8vK/sellCw3CigLCn
 pthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CZl1G0yOWcHR+4w7BioZbnZEDnrT5AWLArVFooO2o4c=;
 b=rtB/ENKzfvI1tXX62rpxtqn0Df392bxMNAZPPCA5+Ivc9w+PT1ehb2uVxebKOMjAlm
 W9+HRfV4R0ccmHrd0e2rvGs8c8zlCvZAVRSxUcXERyB+TgMWJBZ5U5cmGX6ctwIQQVZ+
 m53IIIGRIDL1l/BtbB4cb2+9jvuIzaZBbgcdMYq9zYyf1dqTEfTw5MQIbANwREyiVla0
 nGVxiP3kUUZQnVZznLEZLE3eGmmBkpgJjc8WMKqh/XUSB1U47whreU8BxHeCxUzj/j9G
 z/VZ2WE95tXFS5jeesYp4pQQwF4NVNUvO3T+v6WijndFUH6ShD+TglS/c/XbX55raiD2
 sfTA==
X-Gm-Message-State: AOAM5338x1u/O16nQ/DW7pnGoCXl4IQTES77zDMUv+vFXEQ9lqeSrOrU
 eJl1fmvytPNGlh5KUUKwQSY=
X-Google-Smtp-Source: ABdhPJyxSVABo8qkGB7Wudcok21+GD2dj2PEU388i7rw/ixuqjyPAXobglCig6MbNKyzeogfnUBjzA==
X-Received: by 2002:a17:90a:8581:b0:1b2:7541:af6c with SMTP id
 m1-20020a17090a858100b001b27541af6cmr1747571pjn.48.1650073848590; 
 Fri, 15 Apr 2022 18:50:48 -0700 (PDT)
Received: from d3 ([2405:6580:97e0:3100:ae94:2ee7:59a:4846])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a17090a899200b001d22f3fe3e2sm205313pjn.35.2022.04.15.18.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 18:50:48 -0700 (PDT)
Date: Sat, 16 Apr 2022 10:50:42 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Yihao Han <hanyihao@vivo.com>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@vivo.com
Subject: Re: [PATCH v2] ath11k: simplify if-if to if-else
Message-ID: <Ylog8qhT6X/bYiZZ@d3>
References: <20220415125853.86418-1-hanyihao@vivo.com>
 <ca2944bd-e80e-e0ff-0804-c8439f54b28a@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca2944bd-e80e-e0ff-0804-c8439f54b28a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_185055_171658_C0DE8094 
X-CRM114-Status: GOOD (  20.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2022-04-15 16:02 -0700, Jeff Johnson wrote:
> On 4/15/2022 5:58 AM, Yihao Han wrote:
> > Replace `if (!ab->is_reset)` with `else` for simplification
> > according to the kernel coding style:
> > 
> > "Do not unnecessarily use braces where a single statement will do."
> > 
> > ...
> > 
> > "This does not apply if only one branch of a conditional statement is
> > a single statement; in the latter case use braces in both branches"
> > 
> > Please refer to:
> > https://www.kernel.org/doc/html/v5.17-rc8/process/coding-style.html
> 
> why are you referring to braces when your patch has nothing to do with
> braces?
> 
> changing if (foo) X;if (!foo) Y; to if (foo) X else Y; is not a design
> pattern referenced in the coding style
> 
> > 
> > Suggested-by: Benjamin Poirier <benjamin.poirier@gmail.com>

I did not suggest this change. Please remove this tag.

> > Signed-off-by: Yihao Han <hanyihao@vivo.com>
> > ---
> > v2:edit commit message
> > ---
> >   drivers/net/wireless/ath/ath11k/core.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> > index cbac1919867f..80009482165a 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.c
> > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > @@ -1532,8 +1532,7 @@ static void ath11k_core_restart(struct work_struct *work)
> >   	if (ab->is_reset)
> >   		complete_all(&ab->reconfigure_complete);
> > -
> > -	if (!ab->is_reset)
> > +	else
> >   		ath11k_core_post_reconfigure_recovery(ab);
> >   }
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
