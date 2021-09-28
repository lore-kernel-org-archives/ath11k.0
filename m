Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AEBC433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:50:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB766610FC
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB766610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzNuCSzieHEw5yur6Hzgm7fTOz9eDfg4xY2hEsghbQ0=; b=eq68vNjRn7qS9h
	dNjF3wDYwkps7xJ96MIjlXGUxSuGR8yLVqRs6DAWqMi9W2MuBttpwKFa0zPfyljIly9gZePavPJnI
	kvNQzt94l0eKHXoFrivS/GR+xGw3OIXBCBlWh/OUN3yKTrfi06WUAfax30MzPBDt8L503SU/qkE9a
	0u4UeSwrLUdUALlZVTltvqa2crSjGxbX0JvT2mLnBh7lP1GZEz+bGwwT7FGI49GkwMLHttYvI4Go4
	GpzzUTiD5SymOL1ydrVsw1DxoqwN4d4+3cukWreL0SmTi0xRT1mfr/HusmznrsztohiYx9QGDGNL/
	oTLyZwPWzo7Ik62FaTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVAhB-006qKa-R3; Tue, 28 Sep 2021 10:50:45 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVAh5-006qEL-EN
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 10:50:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632826242; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=8G2v87GHLHx5W9eKDkB7ltn3OG+lhNX/iaI8AL+laXs=;
 b=JGwsloDFF7jtZhvwWbmhq8ZiE46BEUHH8hPMzFHz20/85h14PiIBp0c46nUIEp8550YVCMtC
 OxSH+M/AuHTezgsel/qK1hTR687g49P3Q9YlHfAUcFNu8Ys98Wd4GxJ6ONPdf4gGrU8eyS2X
 audh9g7S/sSrL3sgS0GMaY6nImU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6152f36f3cc3a01f262a81be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 10:50:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F0286C4360D; Tue, 28 Sep 2021 10:50:22 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A8B8C4338F;
 Tue, 28 Sep 2021 10:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0A8B8C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath11k: use hw_params to access board_size and
 cal_offset
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210721201927.100369-2-jouni@codeaurora.org>
References: <20210721201927.100369-2-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928105022.F0286C4360D@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 10:50:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_035042_593569_83C3BF5A 
X-CRM114-Status: UNSURE (   8.69  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> Reuse board_size from hw_params, add cal_offset to hw params.
> This patch is clean up only, there is no change in functionality.
> 
> cal_size was unused, so remove that.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

c72aa32d6d1c ath11k: use hw_params to access board_size and cal_offset
336e7b53c82f ath11k: clean up BDF download functions
e82dfe7b5608 ath11k: add caldata file for multiple radios
4ba3b05ebd0c ath11k: add caldata download support from EEPROM

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210721201927.100369-2-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
