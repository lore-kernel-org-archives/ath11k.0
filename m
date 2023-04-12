Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66122C77B6E
	for <ath11k@archiver.kernel.org>; Wed, 12 Apr 2023 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5X4SqOsvTWvrHndLADCzeTJ3d3Z6/BrC2O1ZZcUHbc=; b=ukudbpvgIjVAW5
	7KxHSxvzFEY2vfkvs6CLOG+SDSRbly44I129tKfcOPWesNlJSKOr9JqQsgB6+dFf+J5NOtU3xccca
	yVBfzzf49Ctrx+4rc7acEdPeMm5ykSTS/ZXVyqnrtuE/0a9nbw4lo+lHoaZ125qKcKCQSmTjbPwOA
	hKQxI53oBrf90wkFknKJJhMrnV8q0vMehQZnt0QALoNpq1s8FDbQwsmqwi0DyBtSw5c5EgGGtb82R
	GGtH52y4R5LH5S445pciGRoQuLt5x1jml9gec5t0EpUen5ZKH+TDd/BoFSs7zsrKcO/CLxhBO6j42
	nDJWj1eJSro02Np5bqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXHo-002V20-2y;
	Wed, 12 Apr 2023 10:01:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXHl-002V10-2G
	for ath11k@lists.infradead.org;
	Wed, 12 Apr 2023 10:01:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D131363264;
	Wed, 12 Apr 2023 10:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5827BC433EF;
	Wed, 12 Apr 2023 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681293663;
	bh=wxQIxrE1sEIPcHGoXAoQ54vdCxjx5JCvEeSNNTXLzYI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=M0svBZ3gmNs6WoDKi5roXLgNnbGcwpvCqV3aiVkjykUJMw31rY5XtjPjR3/1u2AgH
	 2QrBdVq47UvGPKFxZ6Eh17JO53VvX9qbknBbOcsdxT2J06RMIODj+BQgeHjLK4o/s2
	 y74CRd+ejNmDV13qV5QN9jmqEhXEnghPlwFZ9w8sAGfkKTaXGfEulIAGshSKb5p1/r
	 ag/HDuIvBlrd5/HNZl1KyAd8nXld0Tenwkt+9/EvE/YV2z1tu9YYYvV9WpnaeIawB0
	 BYSeYmDpAYQloL67UkinDfYo0OhMRnI/49CBh+vITONDtjpSAdLvbWSP3JzIODRZil
	 8QE7Rz9fsYw/w==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath11k: fix writing to unintended memory region
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230321052900.16895-1-quic_ppranees@quicinc.com>
References: <20230321052900.16895-1-quic_ppranees@quicinc.com>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168129366046.14673.5219483047779494901.kvalo@kernel.org>
Date: Wed, 12 Apr 2023 10:01:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_030105_780831_1B492094 
X-CRM114-Status: UNSURE (   8.63  )
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

> While initializing spectral, the magic value is getting written to the
> invalid memory address leading to random boot-up crash. This occurs
> due to the incorrect index increment in ath11k_dbring_fill_magic_value
> function. Fix it by replacing the existing logic with memset32 to ensure
> there is no invalid memory access.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d3d358efc553 ("ath11k: add spectral/CFR buffer validation support")
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

756a7f90878f wifi: ath11k: fix writing to unintended memory region

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230321052900.16895-1-quic_ppranees@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
