Return-Path: <SRS0=wXcr=JT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F5FC433ED
	for <ath11k@archiver.kernel.org>; Thu, 22 Apr 2021 18:36:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F230E61445
	for <ath11k@archiver.kernel.org>; Thu, 22 Apr 2021 18:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F230E61445
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0BKGje2qCZmv5woQCmZ9nr9OsWL18L+juJzKdnZHDz8=; b=Mt+Sz+Qx50Rnl9KXLOmwA0CZt
	YD5xM6cbb+m8oYsZu+OW7uDymOQVQn1Mww6yuDLVud4/N9EOFXHiTyt8T/XjcZhmvMS2CZUJrbpNp
	UQrSpRkx20wH6WwvMEzhB4n7rLjQgNHMmfbonHakPOVxlSyBS99v74hglJkklEQxBql+rzvC+nSX5
	SVqGf11VX7M34ETR8Ilv5KbYmTVi1tNa8Y7E4GSyQ6o9TUy/VGM8qdkPmCe6VyQ9o4ZtrWy/PMRxQ
	mh3EZ+2jiyVlcYxGZ+J9YOHhgWPXWKe+qVwQsNCpcRbnEEhK/LwsLrPKGaSk5QWoMNsZbBDP1dCep
	TB9COqFdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZeBm-00HFmz-KB; Thu, 22 Apr 2021 18:36:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZeBk-00HFml-8x
 for ath11k@desiato.infradead.org; Thu, 22 Apr 2021 18:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=OxBmPnHU9ndejkgZ+VQYCgISY9oqMAK9CWEIyatUw9U=; b=wvz09Dz+Ox5fsGSslyNbeHQcNI
 X8iQhP0Hym6xaol6jRegdvAxpv8Mi7HJFfXgfhGXh3ujOk3PFU2IBa1PP3GEOPRibYpaXR3CYd4XF
 i0ieqW2poit5aTOUv08npAGIOEtoO92bcniqet1uJKfqhPW8NC770hYeIFTdcrHdK7qGnVZZ/iB5m
 VUsBZb9nqhh29Qr4sWkPvUCt5zBwS14+uFaYYtr+tE7jh3UctV2DlF3J5OWcXa+xI9GmIKOhgA1TL
 aYnAbtjHBb9bBZD6GX7vZ4TnzgcWZj/m/c31sPGnnmQ2aNwiIt8VC8VdB8gfkjqEMm/dy8ROSY0aK
 bjBt1KHw==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZeBh-00DvFX-M2
 for ath11k@lists.infradead.org; Thu, 22 Apr 2021 18:36:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619116588; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OxBmPnHU9ndejkgZ+VQYCgISY9oqMAK9CWEIyatUw9U=;
 b=cEAyhY8DgNZp3w9egujpBMI6yxX3ziHPci4QEnzOIk40Kjw44AK27129kC8yTuNFSUB0urkE
 MXRLzuBzBviUIZ9klb7UbXOBEKqrhIce+eQSHolCwRMyo2RSBtROQIozWsEBdhqrQYh4SUJi
 +fvLkJuoVSHbSjHkZU/+0ZxZc/w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6081c22a2cbba889807868bd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Apr 2021 18:36:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 36624C433D3; Thu, 22 Apr 2021 18:36:26 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: pradeepc)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A52C9C433F1;
 Thu, 22 Apr 2021 18:36:24 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 22 Apr 2021 11:36:24 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
To: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, Miles Hu <milehu@codeaurora.org>,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH v9 3/3] ath11k: translate HE status to radiotap format
In-Reply-To: <20210404125235.5589-4-pradeepc@codeaurora.org>
References: <20210404125235.5589-1-pradeepc@codeaurora.org>
 <20210404125235.5589-4-pradeepc@codeaurora.org>
Message-ID: <191c8590492d39dee3d241576e30b642@codeaurora.org>
X-Sender: pradeepc@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_113629_837455_E52406C2 
X-CRM114-Status: UNSURE (   7.36  )
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

Hi kalle,

I see the status of the series V9 in Deferred state.
As I don't see any comments in the patchwork,
just wanted to confirm if anything is expected from
me?

Thanks
Pradeep

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
