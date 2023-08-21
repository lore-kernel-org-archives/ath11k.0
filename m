Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFF9EE49A6
	for <ath11k@archiver.kernel.org>; Mon, 21 Aug 2023 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xf5OJ7tGD6MrBzVxtSjSZbPdg9gkf7sEaYcjJ8Nn3SI=; b=qZVlFmqG/V2MdO
	VbngnGLAiZmr28jdzkpfx+RNbjIeev3EgYwf+4WC9uxgPoaXoS57MZ4dpFCx0fTu/MfQlT884Dg4Q
	Afi0gKqCCVpG7X6vsvHuTOfNKddyxUwLsXsosO0cC4FOoOnBVVggm50nnmylhMfGA+W/Kvn67Rxf9
	wfvEmX1YwCRNITcxa7NPf/2po+y1LTkW0xR9noQ9REWT6AQYcdIBloXYTqoKl8/yLUa1F3c1I+wv4
	c3lXNXNbRwVBC/A9GXOCsGrXBGdDk9hzg5dv7ynISCJjyol9rAOO03HlndsdPgiIDRO6b1tdfZkds
	Bm18FRE5L73t1Hvze4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY5AA-00E6Iy-22;
	Mon, 21 Aug 2023 13:41:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY5A7-00E6I7-10
	for ath11k@lists.infradead.org;
	Mon, 21 Aug 2023 13:41:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B7BC628D4;
	Mon, 21 Aug 2023 13:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAD5C433C8;
	Mon, 21 Aug 2023 13:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692625302;
	bh=llcWAky7/0VeprxT0Gji6lhNX28k6inu87hMNuVO7Io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Duz3brgrVzq4Vc6da+rOIyvYRJ1x75AftCzmwv78iF9MHPOLns2FMDB4HXTukcU2B
	 Zbf2PxWHwY6HICh3fpEwoqwjkaszpW54cmiowxSGycXiXYg6/V5YBsE89dirNdAPMC
	 Yc9Syn4U2GnCGAVji9KR7Dg+AG6QZQnAPuYbSeIxHmMw6HEVxFX8Iw/RDAG8Ry++xW
	 vSSo7MPPiOwM2LLtjhPwnr1u1KCvlcM7SZQA34yoOy8ZDZIKL4bmrJjZMp/MXR6wVS
	 WjOpZ/uISHH+HZnb2ZUxu6kL1+pSRiC5Rpg54JKIs8ZjXtCsYhs17w09SuJ6WpbyiG
	 AWyZB7dEsnHBQ==
Received: from johan by theta with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qY5A1-0000xg-2T;
	Mon, 21 Aug 2023 15:41:37 +0200
Date: Mon, 21 Aug 2023 15:41:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "Revert "wifi: ath11k: Enable threaded NAPI""
Message-ID: <ZONpkVU1ORHj-zFH@hovoldconsulting.com>
References: <20230809073432.4193-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230809073432.4193-1-johan+linaro@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_064143_393112_A43EC7A7 
X-CRM114-Status: GOOD (  12.62  )
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

Hi Kalle,

On Wed, Aug 09, 2023 at 09:34:32AM +0200, Johan Hovold wrote:

> Disabling threaded NAPI caused a severe regression in 6.5-rc5 by making
> the X13s completely unusable (e.g. no keyboard input, I've seen an RCU
> splat once).
> 
> I'm supposed to be on holiday this week, but thanks to the rain I gave
> rc5 a try and ran into this.
> 
> I've added Bjorn, Mani and Konrad on CC who may be able to help with
> debugging this further if needed while I'm out-of-office.

Back from my holiday now, and this regression is still there with
6.5-rc7.

Any chance we can get the offending commit reverted before 6.5 is
released? 

I'll take a closer look at this meanwhile.

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
