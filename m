Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27D2EB64D8
	for <ath11k@archiver.kernel.org>; Fri, 16 Jun 2023 16:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVj2Q+NAFJcnxNMueZX3Igxer3VFy1aFgHP7e4w8Auo=; b=hFuynzwqAzz2Nn
	XwuF/SftcJgBscSizEwS6AqrcuiJUZ3mtXgSolgrPLb5oFI04mWygdwg/iqVsa6P7tFk8Z5Srkj2O
	GmE0c8SuVXkZcpdEeatbgC5PUG89UE4Oj59PGArFAA6LPd/tX+lKPjrYXw3UdT1Lg7LaDDLEsC8Ht
	1p6CzOQgyFtlBRfYR6cdEo4hcP3KHszhEgxblD8KKCI88cXk68hO8A6yQ12Iu/JlYcv80RwYIrZ+O
	/VONDwcVXhKN71Lyxck0hwXQnZJZpeWIKlmIfCYj404dmZKoxB8f0tnUEkC3gqG3YVUUOgKWVIBlS
	O+zVXQNNyf+aRuwGQO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qABzr-0013Fk-21;
	Fri, 16 Jun 2023 16:08:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qABzp-0013EJ-0E
	for ath11k@lists.infradead.org;
	Fri, 16 Jun 2023 16:08:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C6C2614CC;
	Fri, 16 Jun 2023 16:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086DBC433C8;
	Fri, 16 Jun 2023 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686931698;
	bh=vVuSAFNQlOZX+Auz50QNpcWFgO5PYw/fJf95j9d31YU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=RuDwj04ZKml+dl36jOTJShLy5/xBoVEk1rhZiKqWuxCijtWWzyMSVgiIc/RjPZAQp
	 oSBet9sxE/j6zetiANLE0iDfGVtAjBR8DTs+Vtm+qg02EmvQTzykBV1L/zXy9du+Gp
	 MnwrnfH9z5FeM5NYaClb2AuIBGu3LoRho6P0MUW5nmouN4efYH1WzyJe61iof0zHLn
	 KMzXN1WllJ0wf1kaKG6KljOMbzoANYlq4dGcNr10jdblm+is6OlRXrJ4cGUZdYJRH+
	 /oce8xywinTajZ27SGwFlXTtujYpEE9CgPlKchKLRBL73YGQmjmHSTyf9iFNm4PPlw
	 qYEj3DZIj8yBg==
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] wifi: ath11k: Add missing ops config for IPQ5018 in
 ath11k_ahb_probe()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <TYZPR01MB5556D7AA10ABEDDDD2D8F39EC953A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
References: <TYZPR01MB5556D7AA10ABEDDDD2D8F39EC953A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: quic_srirrama@quicinc.com, quic_kathirve@quicinc.com,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ziyang Huang <hzyitc@outlook.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168693169253.12400.8675945776351103304.kvalo@kernel.org>
Date: Fri, 16 Jun 2023 16:08:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_090821_170812_649BDEBF 
X-CRM114-Status: UNSURE (   7.22  )
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

Ziyang Huang <hzyitc@outlook.com> wrote:

> Without this patch, the IPQ5018 WiFi will fail and print the following
> logs:
> 
>         [   11.033179] ath11k c000000.wifi: unsupported device type 7
>         [   11.033223] ath11k: probe of c000000.wifi failed with error -95
> 
> Fixes: 25edca7bb18a ("wifi: ath11k: add ipq5018 device support")
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

469ddb20cae6 wifi: ath11k: Add missing ops config for IPQ5018 in ath11k_ahb_probe()
80c5390e1f5e wifi: ath11k: Restart firmware after cold boot calibration for IPQ5018
ce282d8de71f wifi: ath11k: Add missing hw_ops->get_ring_selector() for IPQ5018

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/TYZPR01MB5556D7AA10ABEDDDD2D8F39EC953A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
