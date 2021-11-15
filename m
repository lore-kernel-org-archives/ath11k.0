Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5696C433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:55:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33A161BCF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A33A161BCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KvAM8+ugV/J9cClB+q+mdNH7oiYi/odoxSSb2efFP8=; b=ZUFBu82YbDJSbj
	/oYsyjfYaMbnOLBSh8yVTNwmApRMuxVXFIUEIstgtNfTvPNnyamXj8RqXEX785eL0xG5D1xY7ZQJ5
	8Ma2hblMnDEAq8E+noiAA3M1zFXoqk48qmwoSIf3+ZhsizOrArSUv0aT6hucL0wHC42RsLXjYv6Vx
	UfzHo1dkFfUgQSRTX9yV+16G7w1jUNdk1DL1DfM2TiAJgsItYxyDVQl3qGMlgFM9iL5fpil0rKDsK
	VuA8ipHfMul2dZPQCI+X2rjz8FC7H2F36lA8UhGz1IrEhhtV7XQ7wKiKP6mkx3aIR7xU2g24erHLH
	qoOLz/TEKBj7D4bePr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYhn-00F278-Lz; Mon, 15 Nov 2021 09:55:15 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYEW-00Eu63-8x
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:25:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636968300; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=ZDq5DiJo9AZ+O1M/OjrNb9yaoqv4B7MNAgAj8mSGGNQ=;
 b=UXcusCKTZFXHtKSQkMEgAknn1wI/xrip3Z08voaahsbjrFsoojzVhePzDw4IHx8V+P5Qbzo5
 qu2cocCDx2B+s1Dk51kmSAvjOnCQF3+MwIPlzMg2GO7KHmzt7+tSGYqYtcaIr7ll7Dg+rgw9
 DlHylj2NxOEGjCoCcYae/E1AdeY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6192276b4db4233966986a91 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:24:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 78511C43460; Mon, 15 Nov 2021 09:24:59 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 052B7C43617;
 Mon, 15 Nov 2021 09:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 052B7C43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix FCS_ERR flag in radio tap header
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1635164060-18423-1-git-send-email-quic_ppranees@quicinc.com>
References: <1635164060-18423-1-git-send-email-quic_ppranees@quicinc.com>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696829613.13305.16363787111446411919.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:24:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012500_488193_1A59E164 
X-CRM114-Status: UNSURE (   6.92  )
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

P Praneesh <quic_ppranees@quicinc.com> wrote:

> In radio tap header, BAD FCS flag is not updated properly because
> driver failed to update FCS_ERR flag in monitor mode.
> 
> In rx_desc, FCS_ERR information is available in rx_attention
> structure and presence of this field indicates corresponding frame
> failed FCS check.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

787264893c69 ath11k: fix FCS_ERR flag in radio tap header

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1635164060-18423-1-git-send-email-quic_ppranees@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
