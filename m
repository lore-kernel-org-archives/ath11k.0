Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E61C433EF
	for <ath11k@archiver.kernel.org>; Thu, 24 Mar 2022 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHRyPKQtUXjGB0G7yninpXaD9nRqiFJR1JdBgNs+hRQ=; b=P/1yJlH04P1Z2urRsJYliBssnO
	vH8lH79lEd7OTD9ygKP9pspfCgY3nBRf49PSJrt94nJkbPKgR1tXplGVst5gTbkSh6Se10lFd658F
	LBhdnj7SEFynwHvhchorQN7dc65Juii/3hNOmaSpYj2jOhaD8DlVQqlIgSVJnFKQDGxNgCAh+za4j
	MrNL76QBJCB+Y2YnHweexb6v1eQNZkjzsZiTAJkBMFjWrYyHAO1FKC+g9O62ZWmWDSVNGWAtu4+Fk
	Xuygxpt0neJjdXkDbp+IJ8MK6UBkpek1rE8hUMZF2ot7tAr12vaWvSD9+r3Z/eXv9x4cp7HQzFR5I
	ER1X69/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXRur-00HVlm-2N; Thu, 24 Mar 2022 18:10:33 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXRun-00HVkz-9u
 for ath11k@lists.infradead.org; Thu, 24 Mar 2022 18:10:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1648145422; h=Message-ID: References: In-Reply-To: Subject:
 Subject: Cc: To: To: From: From: Date: Content-Transfer-Encoding:
 Content-Type: MIME-Version: Sender: Sender;
 bh=P7l+F5W+JnfONQ+yGtvPnXcDSOEvZtvC8Ey4H8jwmp0=;
 b=sMM6lh2cpU9uztzBJUOw/MXu2uC0CdjcbkF/mCAhDZ/2FZ5e4zxSjqLXkka5W9FH02vNogMx
 8r/ISbQSn/mu21aVv7ZfHKzr5Lq1G3+vToKT46TLoVfs2/FCfFE0TfTHafqa/FMlLJV2SVfK
 m9kZeLJcopO02uYwcprZ4IBQtd8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 623cb40d6da2209201ae634a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Mar 2022 18:10:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 07C7BC4360D; Thu, 24 Mar 2022 18:10:21 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C4B36C4338F;
 Thu, 24 Mar 2022 18:10:20 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 24 Mar 2022 23:40:20 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5 1/3] nl80211: Add support for beacon tx mode
In-Reply-To: <6210385.n8AMQ0p90U@ripper>
References: <1628585783-21139-1-git-send-email-mkenna@codeaurora.org>
 <1628585783-21139-2-git-send-email-mkenna@codeaurora.org>
 <6210385.n8AMQ0p90U@ripper>
Message-ID: <3c54fa579046082c6dc30286ab291936@codeaurora.org>
X-Sender: mkenna@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_111029_463941_7AFA1F0F 
X-CRM114-Status: UNSURE (   8.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-08-10 16:22, Sven Eckelmann wrote:
> On Tuesday, 10 August 2021 10:56:21 CEST Maharaja Kennadyrajan wrote:
>> 1. Staggered mode and 2. Burst mode while bring-up the AP
>> or MESH.
> 
> Why when you bring up mesh or AP when it is actually a global setting 
> for this
> radio/PHY?

[Maha]: yes, it is radio/PHY setting only and it is supported for AP and 
MESH mode now.

> 
> Kind regards,
> 	Sven

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
