Return-Path: <SRS0=P3pu=N6=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B89C433F5
	for <ath11k@archiver.kernel.org>; Wed,  8 Sep 2021 07:02:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E43161100
	for <ath11k@archiver.kernel.org>; Wed,  8 Sep 2021 07:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E43161100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNWcwWhsnJNSatkz2XiN+HFPr/R9FtGjntz5nz3wE3M=; b=khwRICyt5y0dHv
	Ob7GABRHhJd1l4Say6dtKpt3I0JEid39qruAHI0CynrA7Qczd5NSKq4PNbIjIqtl3cjP4unW8hVc4
	g4B1mONeLvJP1yR6E/+oR0r8mGShogvqopeOk5gAE1Ro3NDN5VVf3ao0e6KMD+9WnoGXLF6Sjz/8j
	2g+ze+SJFwb2EE26ej/bl26mi4SyPi4ODFYRVtkVkiugIQmoPSQt2akDiBH15rCmuuCeootqpdQT2
	bRt6NBUFEpEGsNKtSrJEmPOXEwrCqQ1ziwCt7G3tH7ZLTNTGOc0fsrwaRHPto+lYP5R+qX0Ahf04j
	szFiRjnKMKkRXFOfbPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNrbN-005iCD-Iq; Wed, 08 Sep 2021 07:02:33 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNrab-005i1F-8S
 for ath11k@lists.infradead.org; Wed, 08 Sep 2021 07:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=HP3JYBib0733pf46bS3DoQ4PhZZNztZqGHAWUkz0ixg=; 
 t=1631084502; x=1632294102; b=xJrUpamYwrjiMa5NEzCaxS0hSObi+3GyJhm1qNc8izR/vBq
 YLAVejRWkcn5+/zUwvtmfrj1zsWGcYchP8Zut1z384jjXtxUre/PEkbO/V3MbFOrdG1oSbCL8ic3k
 CtfnZYQ79FajnnZHwXp9HZL4tsCdiE8xzXUqU2cep8n8NiNAKyX0DYNYJ8ztaIzFMI2XNGc7ULsyB
 2oJImi4NLcSX2Wx4uzAh+EexVnBoZW/RkDqHEqiuiGB0DbmzzlAwhhn5Gc7ec2EqINdS109/jsfZa
 C/FeUCa1AghUC784herIc16Y42GRPmHhTfat93BPc0tmWHy7UK3iuEegkjnWMNNg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mNraT-004EBi-MR; Wed, 08 Sep 2021 09:01:37 +0200
Message-ID: <fb5dc775524d8c358d2e2fae9e28280d48e49eff.camel@sipsolutions.net>
Subject: Re: [PATCH] cfg80211: AP mode driver offload for FILS association
 crypto
From: Johannes Berg <johannes@sipsolutions.net>
To: Subrat Mishra <subratm@codeaurora.org>, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org
Date: Wed, 08 Sep 2021 09:01:36 +0200
In-Reply-To: <1631083922-24136-1-git-send-email-subratm@codeaurora.org>
References: <1631083922-24136-1-git-send-email-subratm@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_000145_372499_BD3227DB 
X-CRM114-Status: UNSURE (   7.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, 2021-09-08 at 12:22 +0530, Subrat Mishra wrote:
> 
> +	{
> +		.cmd = NL80211_CMD_SET_FILS_AAD,
> +		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
> +		.doit = nl80211_set_fils_aad,
> +		.flags = GENL_UNS_ADMIN_PERM,
> +		.internal_flags = NL80211_FLAG_NEED_NETDEV_UP |
> +				  NL80211_FLAG_NEED_RTNL,

I don't know how long you've been sitting on this patch, but NEED_RTNL
is no longer acceptable.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
