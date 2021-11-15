Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3DCC433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6B2F61BA9
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6B2F61BA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iuDfmjKfK1NsQ2/KmSeFzFaKbXWMytQaj6o2C5evhCs=; b=0GP6xcYSQaU/f5
	gWpOb8wgl60IiSVG3PRK/lsUKJfsOUVZsf7wUERobUrBPU6cWtkOXphHhRqYjKKx0whWew7GSwVyr
	iH+1/XC4/LSXzOy6DxIYGbtmHGqf3X7PKuxO935locRKmYzCOXlQq5FfM9Pc7FsNmv077mV5S+0SA
	unVSHzQAkgmruaFBZREfe1JJcdhvfFtqSgNFcv6R6UydbJuqVN1ssj5rjXW+sDJ3hExdZm7ehBzmG
	q5uXs0E7UPcAIG5h8NvOzEwDh+X8jgMz+oUrCfqAZ2oGe4q6imU80XxsG+TWPQLL+s14aYijzKFFt
	kiX9HElWY82DuNm3SSkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYdN-00F0iG-Nd; Mon, 15 Nov 2021 09:50:41 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYDX-00EuOg-Mf
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:24:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636968239; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Weu2P/9NYhssav+j+Glni3YWiyeayTm+DyG80/W6ZZ0=;
 b=hZC9LCNloxmXdbHmgmezAJR5B5xsVeVwdx3tPCoGdnguqXF4P9Hxdam4H2eexxnaqEM90oxs
 /+y4yV1vJVGa6jL1fIndacLHkiIMVHcaD14zYjXHjuXq4SYJRUzZmCGqpDk/Ztagrr981EMn
 yCJtaZBNtXRQ1tDtZeg7xwW7Vuk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6192272ebb7027b8e18c3616 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:23:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 281DEC4360C; Mon, 15 Nov 2021 09:23:58 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 70F38C4338F;
 Mon, 15 Nov 2021 09:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 70F38C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix the value of msecs_to_jiffies in
 ath11k_debugfs_fw_stats_request
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211026032014.27010-1-quic_wgong@quicinc.com>
References: <20211026032014.27010-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696823438.13305.3819550626057098374.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:23:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012359_847454_4DE2046D 
X-CRM114-Status: UNSURE (   6.41  )
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

> parameter of msecs_to_jiffies should be (3 * 1000) instead of (3 * HZ)
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c8f2d41bbff6 ath11k: fix the value of msecs_to_jiffies in ath11k_debugfs_fw_stats_request

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211026032014.27010-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
