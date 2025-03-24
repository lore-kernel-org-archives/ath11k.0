Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B59C36001
	for <ath11k@archiver.kernel.org>; Mon, 24 Mar 2025 06:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8JLMiI733S4xTq1mEOv/zfYlCWUzTNqm+0T4v8oraU=; b=ZNLdg1bZ31VaP3i5NDiYPG1NmF
	q5YFRcBWLccTZ95FLZ0fHAQLR89MpH85emzeQlV8llq7Vf0L7LNjevoYgLKrSL0c3ndIK2XdqKoGY
	g5DRrIn25DD0ywINsqLdluoaBaU2jd0fLbTr2Igjx+Vv9c9TPYli1i3Oq0deoiID0VqgeRdq9gh47
	Y7XZoz1jwP4bNClVYJTtWisTJ8rqK3CWCUgaGa93/+MK8ioYk3DZzDNN+/Ao9LmyduCrDC1ln8dsG
	UvndrIkd6CpjXTNJgwatSy8RjdKYEE6MVL6tNUuStusm0VnK0wo3F4UH3LLyN5ftBnzAdLophyQpL
	sTabH0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twb6c-00000002IcN-3CGd;
	Mon, 24 Mar 2025 06:16:14 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twb6W-00000002IbW-22ZI
	for ath11k@lists.infradead.org;
	Mon, 24 Mar 2025 06:16:13 +0000
Message-ID: <51a59b41-4214-4e24-bfe8-3d8174ba1a3b@craftyguy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
	s=key1; t=1742796960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8JLMiI733S4xTq1mEOv/zfYlCWUzTNqm+0T4v8oraU=;
	b=AW+seEM8/syKljhEMGkSA3KPt7Al/dEjX1dKgxcynyPa3TzM90Nkz9NV5h8KEnLn5A68h3
	FxZ6EH8ioKxSvJL8hLKfdMixNTsT1QFvBtLxgxyOianttCUaek8gCrrGfuPeTP8L4ClgDk
	/oflXwoN9AcoCuO9PVKg40w3+QxUYU0r/IkmqPYasPmFdRgNfNiDACSNNgGvkkf3+046cO
	4Wv+hZdpFk9byAk/ls69EtsmpsGckON7smiMeAU+T6Mrv3dhjmYhxhQrl9bNv3OcFeluYF
	2Z5lRmC8sbkYx5+7Aj/ikPyxRWFKIhxg2f3ojVkpM27iEeSnQZIfZ/kXVurXSA==
Date: Sun, 23 Mar 2025 23:15:54 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix rx completion meta data corruption
To: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
 Steev Klimaszewski <steev@kali.org>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250321145302.4775-1-johan+linaro@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Clayton Craft <clayton@craftyguy.net>
In-Reply-To: <20250321145302.4775-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_231609_303942_D3F79B58 
X-CRM114-Status: GOOD (  18.74  )
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

On 3/21/25 07:53, Johan Hovold wrote:
> Add the missing memory barrier to make sure that the REO dest ring
> descriptor is read after the head pointer to avoid using stale data on
> weakly ordered architectures like aarch64.
> 
> This may fix the ring-buffer corruption worked around by commit
> f9fff67d2d7c ("wifi: ath11k: Fix SKB corruption in REO destination
> ring") by silently discarding data, and may possibly also address user
> reported errors like:
> 
> 	ath11k_pci 0006:01:00.0: msdu_done bit in attention is not set
> 
> Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org	# 5.6
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218005
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> As I reported here:
> 
> 	https://lore.kernel.org/lkml/Z9G5zEOcTdGKm7Ei@hovoldconsulting.com/
> 
> the ath11k and ath12k appear to be missing a number of memory barriers
> that are required on weakly ordered architectures like aarch64 to avoid
> memory corruption issues.
> 
> Here's a fix for one more such case which people already seem to be
> hitting.
> 
> Note that I've seen one "msdu_done" bit not set warning also with this
> patch so whether it helps with that at all remains to be seen. I'm CCing
> Jens and Steev that see these warnings frequently and that may be able
> to help out with testing.
> 

Before this patch I was seeing this "msdu_done bit" an average of about 
40 times per hour... e.g. a recent boot period of 43hrs saw 1600 of 
these msgs. I've been testing this patch for about 10 hours now 
connected to the same network etc, and haven't seen this "msdu_done bit" 
message once. So, even if it's not completely resolving this for 
everyone, it seems to be a huge improvement for me.

0006:01:00.0 Network controller: Qualcomm Technologies, Inc QCNFA765 
Wireless Network Adapter (rev 01)
ath11k_pci 0006:01:00.0: chip_id 0x2 chip_family 0xb board_id 0x8c 
soc_id 0x400c0210
ath11k_pci 0006:01:00.0: fw_version 0x11088c35 fw_build_timestamp 
2024-04-17 08:34 fw_build_id 
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Tested-by: Clayton Craft <clayton@craftyguy.net>

