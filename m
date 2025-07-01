Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2026FC7EE30
	for <ath11k@archiver.kernel.org>; Tue,  1 Jul 2025 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ashagjkkGjt2ib3LXOywvrNMKchVt11lH66XioE/0yY=; b=G+IjcE+qhHjFFrNbAczlERJdrG
	WAthPNr8VddYiuHhc2EGw3egc5NlqwQ+wXT0aHgIdO6WUcB9XPdwpuKjl3SgmI4eTmnZDjyI4IDXC
	qpnp6VlGToAjbrNrWpoa+5wMfy7EuyOpKrqFgGWhU1KJu2egZmUKLf2Rr/Ewql25SlPwxiuUw7z1k
	ccfLhzegKtONRAsWH6vI365wY/Gqj3/7HuUu5O2FviIIXU30Rt15f3h95M0vb98iWjZB+qTc4rCi3
	DEZBQfbwZ7+HksuIT7NtihYtUHvp6cVBB9KTo5gBOoO6EUqKoA4PeZEzu0zj3HmBPGcctQuB8WPgC
	1xojhm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYE7-00000004khs-3dKf;
	Tue, 01 Jul 2025 10:28:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYBG-00000004kHo-1JsP
	for ath11k@lists.infradead.org;
	Tue, 01 Jul 2025 10:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ACA6A45702;
	Tue,  1 Jul 2025 10:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D14C4CEEB;
	Tue,  1 Jul 2025 10:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751365537;
	bh=1sgmZSc0RqiZBnc+0Tf8VpLK7tigaJ0hMiDLE8raUok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWFtFdlP7LxJXSmkxWjJdgi3ZxiYDS3tcdzS+NdbAXMfm7qvQ3fXE5ThJShDLJuTQ
	 NUtFoF5lXF1oe93UCUwVtp4+oI4E/k4oGz6xvAYgARQ4b0TClNcGG2OIMsf8NI7sbt
	 ewAf1w4ndj1WqKo9kvXITIGmsgzC5a9qYTmLZYpU=
Date: Tue, 1 Jul 2025 12:25:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Yan Zhen <yanzhen@vivo.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>,
	Sujeev Dias <sdias@codeaurora.org>,
	Julia Lawall <julia.lawall@lip6.fr>,
	John Crispin <john@phrozen.org>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
Message-ID: <2025070128-chihuahua-slimness-da88@gregkh>
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630074330.253867-3-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_032538_370080_63E4CFB2 
X-CRM114-Status: UNSURE (   7.73  )
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

On Mon, Jun 30, 2025 at 12:43:29PM +0500, Muhammad Usama Anjum wrote:
> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
> deallocated and there is high possibility that we'll not be able to get
> the same memory allocated from dma when there is high memory pressure.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")

No cc: stable?

