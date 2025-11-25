Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EEDCFD37B
	for <ath11k@archiver.kernel.org>; Tue, 25 Nov 2025 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUasbkstjniBrT4zxMVBFF99A9HoWusdu4FR+HNi+pw=; b=LXrtS+bapi94nCGXzASxrZFgnI
	S7cu/Bo3k9IeVsM7K2Y6g9N4a6L6rBZeWIqHQTAai0/uhGlgXojml5XaQDKVxfJLijBaxxdm/8NHB
	eoMaahpk4OewZES8s3e7D/jyt6FTchdvwX1+aCi6+1TYv7o8yaven9ZIFR44Gc5ykk/W2a6rmMDD1
	iYTOGDChDLfSdotm2TEoC4bSxCRbXD/xvQoJfpRdnd/9poVl7xcmiLlrlAm7vfI625PgWK/6qBwhE
	Lb9jlvE4AJSf05DR41pK+FpA0OaLDmHSiG6g0vmcx1K9YiicO71eqYD6tuLBZi4TvB16TsraY0nY6
	onwtWtFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpoA-0000000D3ld-0Ehp;
	Tue, 25 Nov 2025 09:58:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpo9-0000000D3kx-0Wx3
	for ath11k@bombadil.infradead.org;
	Tue, 25 Nov 2025 09:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rUasbkstjniBrT4zxMVBFF99A9HoWusdu4FR+HNi+pw=; b=hPhScjxnAp7yJkq4TpeZA4oMVw
	Hr6lowpnrnBqBSIa71BrTD6CxwM2nt1fCWkK7tPONBgfNbaqCqe2VhQ1Sb4GHzytrKOmveEk4x/SB
	JjNH8GDteoh6PDtxvc+EbpO2+/VIqIRuSOiBtjUcUo5DhZU8OQKl4wZHwnpZmVk0A2+/pLwlvXbTO
	jJttxmgvmAjR0VKKelCvKuf/HzPxTD223n99C+Cla4THZg3pT+x20/IPPvSB9R3zSYiMg9Ov+BN7Y
	BiJHL43AijLe3oKUB/3wHMU49/MXfFVRRbifR87GgQO1krsZ0JD2F7GzC+5SZSSQV7Gwdxt/iw6E0
	hNud7pAg==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNowU-00000005Uen-0AYY
	for ath11k@lists.infradead.org;
	Tue, 25 Nov 2025 09:02:36 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b7380f66a8bso791241166b.2
        for <ath11k@lists.infradead.org>; Tue, 25 Nov 2025 01:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764064675; x=1764669475; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUasbkstjniBrT4zxMVBFF99A9HoWusdu4FR+HNi+pw=;
        b=DZeQGtADCy2RJHLbOxVCfbpH/CSs3uNLxBpZnDZPjGrj5zcnJFf44JpPOUFhYV5Kgm
         6z0LBXBs3vcFWiVuczU46pej8WFrTPiV8UJEL47utfH5Bwjq2OCYp9sT1PDurN9kYWC6
         XbQVvKW8Rr4UhNIZKpLY5MGhQJ4PSs+tTrzwZULXvWZYEuh+/YL4aKU/x7lBCksoUGtJ
         tNAQ+Mb5YHAsnyi/ELtEXl85KCnJ2stYrE9HPZNdybkQJV+DUbWiSa0jHV0I8o7JIPyn
         8Xm5PdbRqJDstfBrt/ALyVXcLOTHI6oRuURRyTv4lvKY/b+tC2uKInmsjrmHao2/grNy
         HNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764064675; x=1764669475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUasbkstjniBrT4zxMVBFF99A9HoWusdu4FR+HNi+pw=;
        b=ws9KPQcCwcYSacwAB0qGRFjgCVX+K5/a/E15F7Gw4sSCk4FLZS7SrG7gCM2revrv0A
         JpqYBta6UlCsB4+ArqYLdv66RHAiwyF775DqmGKM+SFzNOo5MmM0NZUVfJlbk6nYi78d
         cOq1yAbjTB8FJ1Gmp7G/UEhqIhnh9xVHYs9KnLSp1kYAMnfKJsb1VREF+ROK/9Lo2ZHq
         N9mDOYNzQSyzEjfHm3H2XpHbrQZSDaFeIAPCw91FX5sPrvP2N6WcscusWPf/q/wp06Ba
         qBDHRcqr0iBfBlYEo9RnRQ2nCZ/MPpQjf2jjcXWp5kF3M3yRreLUuJwEOiQZiVt1Hdym
         pdDw==
X-Forwarded-Encrypted: i=1; AJvYcCXV9FhYh51SU6zYm8zvH1tEtvZcQWkVEiUmpm6ognZgJj2DJk/1l/5jjnsJB/6QXN9QOAU4wYU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyia/7djTxq+NOHYll66XGvnmtovpxShMBrHS1FMLxfQWuBMsrf
	NW6Zy8H35FGLhiAa/JzZSaGUteQOXYRXm25BEozeG8/AF2oR7hN8aCnL
X-Gm-Gg: ASbGncv8/nUvLgM86Oh4zIdBDxfponlxEPG/tqd0YoA6tLMkzxFdr89EZ6EPDOi4RvM
	xEgS5s+37CMYl+XNKm2keXLWaDUfiraCMgiL8KJMPOoqNSQL6Wwzwv95nwA6Vj9mNx6QG7E7AkI
	Eo0grNKynP5y24QRvb7sN/q+eNqbvIkAQB7vt3nPma5kDORqlvbapDSalRhW/fwhJrQ19IxjSzP
	sbYBrKCQSa68wrcpUHjEgt4yGdD5Dp3nx8IqQx8lH2yaVqKbIB7LlGHTraq0BDMNwb08qs8Qido
	ylUCEqhf1EJZovzg9Gq1yB/IWydyRTiayVvMMm7ahO/aTAOWMktp5nNIxKFjVw05TfSXvDEayqr
	FwHSs/cl5LzmFqevKQYfsfUD19ad37rk5x/LA8sodAGIFA9EfEMKqo49+qkVP9H5IKRo31Em8bs
	AIKPDra86GLAZCdYnyNkRp6oAprQvmyK0AFG9a5xOEvA4gc4UCB/81AOq2WjidEdSYOzV4VuriY
	DuJlQqYVtgySA==
X-Google-Smtp-Source: AGHT+IHLisWyuG15RnJSodDThe/ELizaIWdtNrkb9dhnJFuydOtd23t6sLVr0LkGdKB4Y4UIprMu/A==
X-Received: by 2002:a17:906:c156:b0:b73:7652:ef9e with SMTP id a640c23a62f3a-b7671a28d01mr1625571366b.55.1764064674836;
        Tue, 25 Nov 2025 01:57:54 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ff3bbesm1539477966b.51.2025.11.25.01.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:57:54 -0800 (PST)
Date: Tue, 25 Nov 2025 10:57:53 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Message-ID: <fasihmiu2szj6m2r3qef5slvzlvdjo2ajhrd6xyqsa5cajrbzq@a5dyulg2dnac>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
 <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
 <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
 <f853d9b2-47f8-47b5-a02d-6aa8f12a4283@oss.qualcomm.com>
 <trr5j57vwk2dhoibdgdxnlkftnmfcmjkwmicsiltmhybxanjaf@tzaeeqcyz56l>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <trr5j57vwk2dhoibdgdxnlkftnmfcmjkwmicsiltmhybxanjaf@tzaeeqcyz56l>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_090234_331619_0B074BE2 
X-CRM114-Status: GOOD (  16.73  )
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

On Tue, Nov 18, 2025 at 12:23:20PM +0530, Manivannan Sadhasivam wrote:
> 
> ath12k doesn't seem to require a calibration variant. But even if the user
> replaces ath11k chipset with ath10k one, the calibration variant should be the
> same as it is platform specific except for WSI.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 

Hi all,

Jumping in on this thread to ask about how we should handle variants.

We are using the WCN7850 device with the ath12k driver and received three
board files for this from Silex, signed by Qualcomm. All three support the
same board (SX-PCEBE), where one is the board file to be used for the
US/EU/JP and the other two are one for higher emissions in the UK/CA and
one for lower emissions in the UK/CA.

Since these are needed for regulatory differences but support the same
board, we were wondering about your views on how to handle that in
mainline. I see that there is no support for the board file selection in
the device tree for ath12k, and that there is some discussion on how to
handle variants in general. We are using a device tree-based setup and no
ACPI.

Thanks!

Kind regards,
Ernest

