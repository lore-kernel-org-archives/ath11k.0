Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F29C433EF
	for <ath11k@archiver.kernel.org>; Wed,  6 Apr 2022 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cs0BLN/trCGJYKUrK6Nkd5/4YpBXL6cCzR0Q38zC0Tk=; b=l2fatSY/x8Bxlo
	gt6ndbUkuCJfiwGLpkB7nbTGQqet7kk3dAeuCI8I/KZprO4v/6lsOABlnUecsG/PraX/jdR5EYr52
	zFrfhrvdwUgwssD5XsOK0da8dyKT29mE1qq1TBcv6rD+O+Kc761yuAgBNHTARa80juOJjNIxf6mRi
	dyNvcaxlApOX5arCv3WoHLXtw0f/lUSxr9EsHCmUPLcd15tZCkpnFL23iC3ujqGn6IEcyKe1fdm1M
	Ppk/QMdsS3SRU+3ETopZmQiJKyhDyluySa8Is+Nw2UvaNywTML4meLtAV/PXR7ALWJlJkm/By6FHY
	49ZfrMSKBtiMgxxKwbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc7HB-006koF-Qn; Wed, 06 Apr 2022 15:08:53 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc7H8-006km1-Na
 for ath11k@lists.infradead.org; Wed, 06 Apr 2022 15:08:51 +0000
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-deb9295679so3208311fac.6
 for <ath11k@lists.infradead.org>; Wed, 06 Apr 2022 08:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RBUbX74ObfqzzSNCHOoh02AEXuH/Bv5AB2YAxYPhz64=;
 b=uh4EqdixnlfdBYr+Kwu3/6Ec7PZKnuR0rygmUWY9kQ2JLux4gzSvaXmvXpChVnx6Ys
 e8SIhlYqWjIPZjcaMo9CRMxX/xP5f2EGINrZ1aODyUOtqc48+HE4qlxgnX64nSx8DOIC
 5fk10hwso3ziPJ40iOXYiKAa9d6Mbm8aes2z5K5q5HiIcMU5R6t32EK0eS//kd3h6kcE
 stKPHBOcZa8Ys0XFCG1mXjVdgVC1yx/aBRLcA8Y26achIiNuPYLim/EpV7pykgQJDVLC
 ShE7UldyKHYmLsqQFgaFLX6ree0t/dPQeFvd3B7I+z9JtZZ4vlIZ+nGWtRjGkBM2K3ts
 UTvQ==
X-Gm-Message-State: AOAM5317jzBvIu6l8Aa9ERnKoT9L0G2f4DsNqyIAD/oZjLi+apHmbrsc
 kr4HAg9Gjev6l5X4rPy2mg==
X-Google-Smtp-Source: ABdhPJx1qtYaiwuI0WnLa7ET2uBlBwt+jJZcV45wjauHWImhM3vIaQgljQ4NKCifrB4FrBLJqNNfRA==
X-Received: by 2002:a05:6870:c1cb:b0:dd:b81f:3ea1 with SMTP id
 i11-20020a056870c1cb00b000ddb81f3ea1mr4004298oad.131.1649257723709; 
 Wed, 06 Apr 2022 08:08:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 fw15-20020a056870080f00b000ddc3ec2533sm6547545oab.9.2022.04.06.08.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:08:43 -0700 (PDT)
Received: (nullmailer pid 2253710 invoked by uid 1000);
 Wed, 06 Apr 2022 15:08:42 -0000
Date: Wed, 6 Apr 2022 10:08:42 -0500
From: Rob Herring <robh@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: linux-wireless@vger.kernel.org, mka@chromium.org,
 ath11k@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/12] dt: bindings: net: add bindings of WCN6750 for
 ath11k
Message-ID: <Yk2s+srO9DKP7xW1@robh.at.kernel.org>
References: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
 <20220406094107.17878-2-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406094107.17878-2-quic_mpubbise@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_080850_801733_E4C4D91B 
X-CRM114-Status: GOOD (  16.87  )
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

On Wed, 06 Apr 2022 15:10:55 +0530, Manikanta Pubbisetty wrote:
> WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
> Though being a PCIe based solution, it is not attached to
> the APSS processor (Application Processor SubSystem), it is
> instead attached to another tiny processor called WPSS Q6
> processor (Wireless Processor SubSystem) on the SC7280 MSM,
> where the WLAN firmware runs, and it is the WLAN firmware
> running on the Q6 processor which enumerates WCN6750, as a
> result APPS processor would never know such a device being
> present in the system and would not detect the WCN6750
> hardware unless and otherwise WCN6750 is registered as a
> platform device. This is the reason behind adding WCN6750
> WLAN node in the device tree.
> 
> Add WCN6750 wireless driver support, its based on ath11k driver.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
>  .../bindings/net/wireless/qcom,ath11k.yaml    | 361 ++++++++++++------
>  1 file changed, 252 insertions(+), 109 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
