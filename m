Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9011FD3B992
	for <ath11k@archiver.kernel.org>; Tue,  9 Dec 2025 19:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMhqK2h5cqDpG+qu8dGVzUXG1FAHK7ZbqnaEs93JJHQ=; b=TP5kC9/rFbvc7MU7nuifsqER70
	Ag7b/XL8Htyrdk+Kf7wEqltRpUqgxZzqglgunTqrxid0uk84bkHz4wg6gLFK8EqXYK7G3cTo+kyeb
	ZKX5rxgrD2LazEkzGCsjC0YuJJuXETM+V/tQsWu8d4+6sO4IJ0Om/CbUvO3bsQpJVxSJBefSd17IO
	E76WYMPygcu2zUsNsluPTbqvtctAimVvwo0Kr6DMgetkksVhIReoDblFQAkRoUBdfXCjPvKIhZtew
	71ikxS6ftpx/9SG5zrwlA3NkVhj2mt3ElougHmrZGul3TVaqSbKQMq6tRUqG89jdllXdKe+LR9qiM
	7x9FhYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT3pE-0000000Ei6X-1FO5;
	Tue, 09 Dec 2025 19:56:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT3pC-0000000Ei6D-2ktJ
	for ath11k@lists.infradead.org;
	Tue, 09 Dec 2025 19:56:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0165D436E9;
	Tue,  9 Dec 2025 19:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67528C4CEF5;
	Tue,  9 Dec 2025 19:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765310201;
	bh=Dq6vVcM9EIHywsyjVDP17JBVvTmECn0e4FCYDopnSo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtlozrW/QyLbuxYMECeTqRhMFLv3t3F8Z/yFhwQEQUEjzgKxaHuDdxuQJGS9/y4nx
	 DlN0zv1JCeWafL+5CvD1gSwCyCm4r3k5oKzhikRLW4NhuNgXgAM7VD1M9nYZvZ2T7i
	 JtNRg9XjBEy59++fNWESMZrca8gHgcpSJuypMv0VhKAFnxUw5c5AusnR3XbyW1KQmT
	 lg43NdBHFvTYX/7o+EvUtV9EPi/R+y9LhRFLvERGqmotQMF3Cv7mLIjUtvcFNS6lZb
	 Q5Ep3qXsH63zmnjVVpW9pR2LiU7UG3Czt1L6Za7HSPMe3YMCKwqyW7AEeJu/8CoVan
	 8mtt1TGJgfcZg==
Date: Tue, 9 Dec 2025 13:56:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, krzk+dt@kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	johannes@sipsolutions.net, jjohnson@kernel.org
Subject: Re: [PATCH ath-current 2/2] dt-bindings: net: wireless: ath11k-pci:
 deprecate 'firmware-name' property
Message-ID: <176531018921.1011228.15625154455386723373.robh@kernel.org>
References: <20251204071100.970518-1-miaoqing.pan@oss.qualcomm.com>
 <20251204071100.970518-3-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204071100.970518-3-miaoqing.pan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_115642_717543_6D9E6A02 
X-CRM114-Status: UNSURE (   9.25  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On Thu, 04 Dec 2025 15:11:00 +0800, Miaoqing Pan wrote:
> The firmware-name property was introduced to allow end-users and
> integrators to select usecase specific firmware for the WCN6855.
> However, specifying firmware for an M.2 WLAN module in the Device
> Tree is not appropriate. Instead, this functionality will be handled
> within the ath11k driver.
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


