Return-Path: <SRS0=U53r=P7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9AFC433F5
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 09:52:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1BED604DB
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 09:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1BED604DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXSpdm/LawiFkNWB9goDI3SEnAQz0DNBfimo4c3FnAM=; b=HywoKxKrnv7qIj
	lSjjw9e59+8n2m+9vp8+isu3g49tf5Vo7ilhJf1UtqEcIi5jpHnhzaaMx6m4jExJlDpAB5Umo4wOv
	RQnD3UQWlOTR7aAHYf1UhcOgmfw8qpdp3BeKnzPUNULNMITN8gHlEiEXVNzhzJqOBuKJFXxvJ8uyd
	6f18qPyFZjOqGEkQka25VlRpwYmfva9V7zMjTLfbZU3Zx/btj7qX4gLPHwaKvYTfTpd1mYuLccdii
	E0Gpg20o2JOLH5u2Rs/VIOUI5PR0UsR92iMGa+ZrEXJw8dBQZ3EtxG7CjiTP1PQ6HtaLSuDlTxok6
	N1oWSCTQU/0rnDSjNUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlTEC-009u7m-5S; Fri, 12 Nov 2021 09:52:12 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlTE9-009u4Q-OI
 for ath11k@lists.infradead.org; Fri, 12 Nov 2021 09:52:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636710728; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=/zCpRT63mnO+KjCn3Vvfhc6iabeFMMs2BFMUyiQmfik=;
 b=H9IlYK6j2Zo+DqWaHv0x+TCwV7W9EJmrW3BMn35ulLKW9jblQFBXNkMlyvIYlxDgepA6W5fB
 1hMPCA9YKGzO5HfbskYPVYpi7t1B81Vlf7XQMwbhuVBrkQwvi1uRBRuZLPx7DZbeGo1lWHd/
 VNbZjuh2rBhS5jQVD3ue5xeQjf0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 618e392ff6c5b6c8d509be64 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Nov 2021 09:51:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9C0C7C43460; Fri, 12 Nov 2021 09:51:42 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CE41AC4360C;
 Fri, 12 Nov 2021 09:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CE41AC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add provision to configure rx hashmap
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1635164316-27055-1-git-send-email-quic_ppranees@quicinc.com>
References: <1635164316-27055-1-git-send-email-quic_ppranees@quicinc.com>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>, Sriram R <quic_srirrama@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163671069706.11814.3105845576240199326.kvalo@codeaurora.org>
Date: Fri, 12 Nov 2021 09:51:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_015209_890791_62C978E1 
X-CRM114-Status: GOOD (  11.00  )
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

> Currently the hashmap is set to default during REO setup and all REO
> rings are equally distributed across 32 hash values.
> 
> In multiple radio cases, 40MHz+80MHz+160MHz, distributing received
> packets across all the CPU will cause CPU overhead. In this case,
> during runtime we can span 40MHz and 80MHz among 2 cores and remaining
> 2 cores are equally distributed for 160MHz by using register mapping.
> 
> Add provision to configure the hashmap during runtime through debugfs
> for improving flexibility to control the destination HW rx queues/rings,
> so that affinity could be used to assign those interrupts to specific
> rings. Setting 0 will disable hash based steering.
> 
> echo "hashmap" > /sys/kernel/debug/ath11k/ipq8074\ hw2.0/rx_hash
> 
> Developers who are aware of hardware register mapping can leverage
> this rx_hash debugfs.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>

debugfs is for debugging and testing. To me it looks like this feature is for
configuring the driver, not debugging.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1635164316-27055-1-git-send-email-quic_ppranees@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
