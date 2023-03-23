Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A93C76196
	for <ath11k@archiver.kernel.org>; Thu, 23 Mar 2023 05:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H69S6SVxG8Mv3RT63MNllqBViLi0fC2Dn9n7cycEE6Q=; b=r0WgNfKQPq/tOo
	r2Cxaa7oztQaKZ8L7WeZ1dNvmVWzwFr18DxfxTMRue57BQ3VZKq9/0zcHjK6YXwc+HSbRTc3b7N8K
	3q45LVvd/HeeXcSVAVeZdp4Q3wfbqQe1PkPI/2gV67biCuWCKab6G31xq7d8RssdYw/oV0uGh4E7V
	U3VJ+DvlmiUnkJ1e1UlSdgg9SExScxYWsSGSK2L458vd3ei9rAfcyXGXHrOVI/qCO08ZVax3XmVvx
	5VFfQei+MqAe4ZcRU0+SrEu9lFV7rKyIH0ukv3C2PgPGiGZby26fZ20PATGXq3Ym2lXj4QNeqCMTr
	yIu62PqILQDkV3OEq3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfDXg-000r2S-11;
	Thu, 23 Mar 2023 05:31:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfDXd-000r0a-1V
	for ath11k@lists.infradead.org;
	Thu, 23 Mar 2023 05:31:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AA2E3CE1FBA;
	Thu, 23 Mar 2023 05:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEE8C4339E;
	Thu, 23 Mar 2023 05:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679549464;
	bh=5tQnInfyM1glGvlLMveAFr71G5YuWbPE3nEwMpsAtHw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qOuovdeYyJLcMiGvwfiZJlmFRbklfKBM4aXWcVQAtprFuBp72TFESKWa3Fh8srQk5
	 cCRs59bPpekQXpEHThx3DPuRy1LEDztJ11Zs4x1l90UBhY+3mraJjHX+/btIoXH4fR
	 fmrBQkr3d+OlF3nuLADUlnA2fUYG+oMxSEUuH2V/qeeuiqw5SH8N+u43d5R4wO9UUN
	 4G+vh7xG9lpF6Fv5tkammvO4y0PQS+WoWJcMFGwMkSAPJzTiYnLMVy/pn99faNpxDi
	 HRGnb4Oc/amd8uZAmj9Fx2L836sPGuy/6Xjd69JPL43mBH+kbQNIGcEu6h2K7Kun4i
	 Ed7z45xIieF+A==
From: Kalle Valo <kvalo@kernel.org>
To: Federico Pietro Briata <federico@briata.org>
Cc: Felix Fietkau <nbd@nbd.name>,  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,
    ath11k@lists.infradead.org
Subject: Re: help with Qualcomm QCA6696
References: <20230123090555.21415-1-git@qrsnap.io>
	<167950811348.23855.15517111358348733076.kvalo@kernel.org>
	<CA+KKcbm9qy2yAjVZptTEQa7Z3UALcVbD2GbeHNrYufM6cfvZuw@mail.gmail.com>
Date: Thu, 23 Mar 2023 07:31:00 +0200
In-Reply-To: <CA+KKcbm9qy2yAjVZptTEQa7Z3UALcVbD2GbeHNrYufM6cfvZuw@mail.gmail.com>
	(Federico Pietro Briata's message of "Thu, 23 Mar 2023 01:39:43
	+0100")
Message-ID: <87h6ucdoff.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_223113_728479_96E65602 
X-CRM114-Status: GOOD (  12.36  )
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

+ ath11k list

Federico Pietro Briata <federico@briata.org> writes:

> I would like to use the wifi chipset QCA6696 to create a mesh network,
> best in ibss or 802.11s mode. I got from quectel a wifi driver but it
> seems to support just AP and STA, but from my understanding I shall be
> able to test at least WiFi SON or EasyMesh. Do you know if the support
> for this chip it's avaiable with the community driver?

I don't know what hardware ids QCA6696 has but in theory ath11k supports
that family (QCA6390) of devices, though some changes might be needed.
But ath11k won't help you as it only support station and AP interface
modes with QCA6390 family.

BTW please don't send HTML emails, our lists drop those.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
