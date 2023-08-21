Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1921CEE49AA
	for <ath11k@archiver.kernel.org>; Mon, 21 Aug 2023 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ut91GBmRdRMa/Jyugcnp1PhEXcM1VSmC1kkbZXoj0v8=; b=eD+BIxX0v0GiA1
	/PTupTArEJ4LguPIIsj+jkxKcqEfKdUxPB0GAZnk1nmNu9qQqrRoyKfG7Gc7ZIK4hRBXIrKrOvQXJ
	vXuR5bJztvRMPe1HHnR2OiM4LJpS0abxBouJyXRSNqnE1N4yZ1vf2fZjy/xGMqGLYoc7tByG26seR
	PWGBJ4JMVUWusL6hLxk8EkP+Lx7C8VLc4P21iJwCDs1YOGPtxXiaVAts9+63hHlSme/jiYJE3u6rn
	StUTQZ65pJ/cs0Hb4ESOWfEO8B8XKuFhHkGse/xSuLaXWgu5BkEm4L2pEHbQkfv3sAOQl3+DXeQ53
	9/vwx5zJSBj5XKBP6Bmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY4yN-00E57S-2d;
	Mon, 21 Aug 2023 13:29:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY4yL-00E56n-1x
	for ath11k@lists.infradead.org;
	Mon, 21 Aug 2023 13:29:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1094D6373D;
	Mon, 21 Aug 2023 13:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD4BC433C8;
	Mon, 21 Aug 2023 13:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692624572;
	bh=fSfkleXtNPj98d5b1azTlZSdZRBfJtnFl1WtA8fTpRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=paC4E0fkT/z5I0yHawolGIex2U3OfGFyvI8vSgjX1Y8ghvyX0zZJIVT4HX4rHAAi4
	 QyVHKFHUScuNpNnrYfGGvNwOVuMkfNztA/BqmEoeGg2APaAd3an3E0nITqhshFct3x
	 Ps5Fm8/ex74ml9qhJAhbYA8ZVO0sAqYnhFbFWbgzYclDxxoksRBxvnLBxF+/VcTBSS
	 11+zQkiqJxWtc3ZBq9McQ8uqeIdw0VMOIk7spV/Z3NYoIXoixbaFb/qb9IAfV4HEgX
	 ZPZ2x9yMWczzit2pJ5Pz03J37B6tIYocq+d4Ljbvz3L1WOLFHvKv8DqAy7g/k/7u2j
	 IHmPyDesc758Q==
Received: from johan by theta with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qY4yG-0000j4-1k;
	Mon, 21 Aug 2023 15:29:28 +0200
Date: Mon, 21 Aug 2023 15:29:28 +0200
From: Johan Hovold <johan@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "Revert "wifi: ath11k: Enable threaded NAPI""
Message-ID: <ZONmuKhShSxBUHZH@hovoldconsulting.com>
References: <20230809073432.4193-1-johan+linaro@kernel.org>
 <42f78c02-1ddc-cf1c-694f-abf9059dfb60@quicinc.com>
 <ZNNZVsFb3_Dt_NMb@hovoldconsulting.com>
 <25b778d4-81dc-506b-47f1-e9f16d49682f@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25b778d4-81dc-506b-47f1-e9f16d49682f@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_062933_707386_2E3D0502 
X-CRM114-Status: UNSURE (   8.31  )
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

On Thu, Aug 10, 2023 at 10:16:21AM +0530, Manikanta Pubbisetty wrote:

> Also it is worth to give a try with this patch here https://patchwork.kernel.org/project/linux-wireless/patch/20230601033840.2997-1-quic_bqiang@quicinc.com/
> . This seems to be fixing some known interrupt issue on WCN6855. Could you
> pls give a try?

That patch makes no difference as the X13s use multiple MSIs (so
ath11k_pci_set_irq_affinity_hint() is a noop).

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
