Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56C4C4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 07:04:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E1B422EBF
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 07:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E1B422EBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dvF62tG5cVDOKwZzlWsOIvfaeLlKLV68/fT7cHA2WmI=; b=3deDMjQ/RxB7bJyNgI6OGYPm8O
	7476XQggt7WSGcDUBo9MXLdbgMpEm9imqQX9GaY6603VteLJZJvqtKo/SuTvlaluGbbEDk2tb8Gfh
	qymMmJRflaprX84h9d/ikURPng8NCeSekMVgnXEml6HiZuiLgQ4dSK5zBFCvvzw4iMX5ja75yKeIZ
	TySrcWXis00Xc54jTDiZQ6SGExbntdNL2CpRmsLWQPDjMXF5ET/pJ4U8+WPoVDLWukPkAD373q2DE
	Lgx8M/+BFeR+3FHCnUlvK8DGq++xDepo3qx2Pf+Ypa9VLcYP1kYmDfhc81wTernrQk196nv74Ueif
	X/Lj1MZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpQr6-0005DT-8H; Wed, 16 Dec 2020 07:04:12 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpQr2-0005C9-BG
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 07:04:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608102237; h=Content-Type: MIME-Version: Message-ID: Date:
 Subject: To: From: Sender;
 bh=xFnpcIs66mgoI4tzxRmrbTfV3nMvkRMQWfh8wnm6hOM=;
 b=fh0przar24QOkgzo0JWKXsM/9dnZ9gEymN5h2nJIzqmxoK3CjArCHkDGnB4yp9XRqRuMvzU6
 yFZZetcio3DJhMQR3X5xd0PJLdB6sY2ps7K3OMQ8FnJUs+pdGAfdTzA9zF9YRtr69QF7D3n2
 GgqdeN6FXeNOX7uL/U9Bed7F3/E=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fd9b15c93a3d2b1cd349620 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 07:03:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B72B0C43462; Wed, 16 Dec 2020 07:03:55 +0000 (UTC)
Received: from x230.qca.qualcomm.com (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 59178C433C6;
 Wed, 16 Dec 2020 07:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 59178C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath10k@lists.infradead.org, ath11k@lists.infradead.org
Subject: ath10k and ath11k lists added to lore.kernel.org
Date: Wed, 16 Dec 2020 09:03:51 +0200
Message-ID: <87ft46grl4.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_020408_436694_135B200E 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Hi,

ath10k and ath11k list archives are now available from lore.kernel.org:

https://lore.kernel.org/ath10k/

https://lore.kernel.org/ath11k/

They have full archives starting when lists were created (ath10k 2013
and ath11k 2019). So I recommend using lore archives over
lists.infradead.org as infradead lost parts of archives during a disk
crash.

Kalle

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
