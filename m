Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF9CC433F5
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E3FC610CA
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E3FC610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87b5MxlG5HAM6xwdneQ4zuzQvvOcQEs0jg2fl+ZjcMY=; b=IyJsaYlaUoULnL
	11+8ZfaSuENz7LPgA4epXZJT1iLWwAG19fcStuFjlhuKCZyzYeDqZp4Pu3/UyPWUiLJ1x7REcQh/k
	EbNJV+zEdajTEukhGBYk/qJQdJm0ZqZML1dhipR5wqEeh8ge8Hn/cHJvq+r2GgTGhYQ4Go6sPvsJc
	crRqR7isP+X7OuhxDEbUkmRn/M8A3E37MwtFIdNGmeO6LxxZ12yWLG8N5cKmwQqplyV+3gXMBRENZ
	sAJTO2ox+7b7QGPwf1u7QuyJHLyPndqFcANUbApCsy91nn/c8AiRDvHKOOcBj9J8HYO0ys6cIuFik
	9OCDqJNWFh6XIibn0oHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGcf-0040al-2k; Wed, 17 Nov 2021 08:48:53 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGcc-0040aG-5U
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 08:48:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637138929; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Va4OnKJJNqeV+RT0nY6jUwSah1RO4b+0ZmF3us1G63E=;
 b=ogzLeH29LeU54GaKqOaz3ePd5j5KPeNt8/npMXbdCEpLVEpsIkCNGESmCeiVUrLdRS2LDA8X
 dcaYSXd7qThtkaH/YQTdYEcugWswyGKqW7DeYh0bIZR8puXymUg9ZDMGYdPCvmpp7cqenLvb
 pTGbMB1guxfUHqYCKFkBGMOEYps=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6194c1f0c48ba48884ef0b6a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 08:48:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8FC4AC43460; Wed, 17 Nov 2021 08:48:48 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 33E47C4338F;
 Wed, 17 Nov 2021 08:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 33E47C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/4] ath11k: add ath11k_qmi_free_resource() for recovery
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211116041522.23529-2-quic_wgong@quicinc.com>
References: <20211116041522.23529-2-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713892498.10263.2312396236754200205.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 08:48:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_004850_307574_3DC57196 
X-CRM114-Status: UNSURE (   7.76  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> ath11k_qmi_free_target_mem_chunk() and ath11k_qmi_m3_free() is static
> in qmi.c, they are needed for recovery, export them in a new function.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Wen mentioned me privately that some extra features are needed to get
this working, so dropping the patchset.

4 patches set to Changes Requested.

12621327 [v4,1/4] ath11k: add ath11k_qmi_free_resource() for recovery
12621331 [v4,2/4] ath11k: fix invalid m3 buffer address
12621329 [v4,3/4] ath11k: add support for device recovery for QCA6390
12621333 [v4,4/4] ath11k: add synchronization operation between reconfigure of mac80211 and ath11k_base

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211116041522.23529-2-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
