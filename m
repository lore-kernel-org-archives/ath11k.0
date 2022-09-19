Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7903C54EE9
	for <ath11k@archiver.kernel.org>; Mon, 19 Sep 2022 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43N4cGnGvx6q8vOAG1U+oenmQsC8jm6FDUAbpW76mFU=; b=l/+NI1+AwbpTZD
	waz9PE3wo42OxwqaCqVu4mHPgN06RxZZNGFRZADvkq0iuTv8LKXNAzOdJOMLJPIpCH8QdYKlQtd/+
	XcI/GIxd0oZrJhw93cqkiaJhz7pX2PZRfrnRO/TMzhfs1TcjX/e3BJYIokyDUctSbIdzUTN/lBtSC
	SB8ZpG6Hi31lCQY1gCZdv4H/VE7xqJIuNJ4+1JkuEwTEh2hmWxdp/ZFujNYLeTgq4j0Qp3c6PPDWO
	kkCN1FLvAN495ICERzEK1KpfejZ4X215rWaq5qXzacAnP+q0+u+blEEXdXkoTorj12u/JXUAcxLdS
	7Jy/EtXYQnRiEDPEDkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGRb-00BnzH-MP; Mon, 19 Sep 2022 13:04:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGRA-00Bnu9-Fq
	for ath11k@lists.infradead.org; Mon, 19 Sep 2022 13:03:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A6FB161165;
	Mon, 19 Sep 2022 13:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C01C433C1;
	Mon, 19 Sep 2022 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663592627;
	bh=qWWYH4oPxyt4F2eriRjE9L3xJK1Sgu6Hh4lXFLgL9Qk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=mBpLPFFduAlWGGSlQRK3Fc61BwoOQCcM3HCIC7Rcuvp/hhFoCP8JmALrdOJOSxc1e
	 VR4yx619kKwBGfeeLYv7NnjJ8rYYMlUsK0uBUivdPRSmz7zxIr+ClBJUOiCwPSxGcq
	 7JueOKyXSzPgziiyfCM7sQsBfx6xyul109Uk6A+UXx2UtY7z0ha5rLV0a83KLa5MSk
	 QmFi2DroHZYwMm6JUQdkQuXJGzrudZfXAvk0O29rKD0jH6Y2+yRtbjaY02U+UBG9C/
	 3WXi6o+mEn2xZI4HS8Sl2G0NYblnXP1p3o46n4om3u7cMldnNQlMqzWG2iS4AgNnX4
	 z5sMUXiJJPzuw==
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] dt: bindings: net: add bindings to add WoW support
 on
 WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220902112520.24804-2-quic_mpubbise@quicinc.com>
References: <20220902112520.24804-2-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>,
 "Manikanta Pubbisetty" <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166359262191.25311.8343606005325253163.kvalo@kernel.org>
Date: Mon, 19 Sep 2022 13:03:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_060348_640510_13568F94 
X-CRM114-Status: UNSURE (   8.69  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Add required bindings to support WoW (Wake on Wireless) on
> WCN6750 which is based on ath11k driver.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

957f60273af8 dt: bindings: net: add bindings to add WoW support on WCN6750
69ccee619a38 wifi: ath11k: Add WoW support for WCN6750

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220902112520.24804-2-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
