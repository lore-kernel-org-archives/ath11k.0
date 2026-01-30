Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91274D49C69
	for <ath11k@archiver.kernel.org>; Fri, 30 Jan 2026 07:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxrW9ETbBNzSeSrVWsa/TL7QUsND7/iXmMFvytA+xzs=; b=N7TOmRSWYdpzEY6BccCg4Y/Nwr
	V2sJRUYGltcZnK38cLdGVHwIKJLnECCbjaTONddNt7gCG5A7aJqGlQKZxN00vmNKaVHiQ383EvNPN
	VxCydfTupKHMRBnesT2NDwyKI1DgUM5yERfrbRkzfSuTj+PMzccOqGjcEUZXfwhuV3ALVcTKkl76B
	TspwDEIGjQWOLDJnOK2fWr20mabWUwo+NzXGUoIA/DzVhT+V4DXgDSpraqBWq+eygaMt7n3T+hT9/
	X4+lIpcjDvSCZ5xvevndiRag3JVDktoIQhkg6kH6LRrx8joXIEicDfTRGwiqfDnSnh8MblrAtYk3H
	1IeLrJZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljBM-000000019qD-0JBi;
	Fri, 30 Jan 2026 07:44:44 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljBI-000000019oz-0hYQ
	for ath11k@lists.infradead.org;
	Fri, 30 Jan 2026 07:44:42 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3288ed044;
	Fri, 30 Jan 2026 15:44:27 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	baochen.qiang@oss.qualcomm.com,
	jianhao.xu@seu.edu.cn,
	jjohnson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	zilin@seu.edu.cn
Subject: Re: [PATCH v2] wifi: ath11k: fix memory leaks in beacon template setup
Date: Fri, 30 Jan 2026 07:44:26 +0000
Message-Id: <20260130074426.63517-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <97b132e8-d3b2-4e52-aa74-c8aeb0f5d516@oss.qualcomm.com>
References: <97b132e8-d3b2-4e52-aa74-c8aeb0f5d516@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c0ddc4b9c03a1kunmed20031614a423
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkNOVkwdSksfGR4dTBpJTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=OHwbRpFSsU6IIhOQFDMjnyPOpaOL+QC8uBYyUAoG/1jESujr4ryGiteLrOMD0YfpfvUoHwZoP6RabS0rvUyqsw3tTqkwVHqGNhORNjUGpHYue8hi2n1KAvD5kfFMiatJUnEMoOxGi5RuipZXUpx4AEwKTNkWgFJtRJS8aS96KxU=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=dxrW9ETbBNzSeSrVWsa/TL7QUsND7/iXmMFvytA+xzs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_234440_846145_A9CF1308 
X-CRM114-Status: GOOD (  10.50  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Thu, Jan 29, 2026 at 07:36:43AM -0800, Jeff Johnson wrote:
> I prefer strict logical consistency so I prefer either adding the goto or
> removing the beacons->cnt check.
> 
> Or a completely different approach would be to use cleanup.h functionality and
> annotate beacons with __free(ieee80211_beacon_free_ema_list) so that no
> explicit calls to that function are required. If you try this approach then
> beacons must be defined at the point of allocation:
> 
> 	struct ieee80211_ema_beacons *beacons __free(ieee80211_beacon_free_ema_list) =
> 		ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
> 						       tx_arvif->vif, 0);
> 
> Note that I have not tried this approach with allocations other than from the
> kmalloc() family with __free(kfree), but in theory this should work.
> 
> /jeff

Thanks! I'll add the goto path for the beacons->cnt check in v3.

Best regards,
Zilin

