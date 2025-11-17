Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B44CEACEF
	for <ath11k@archiver.kernel.org>; Mon, 17 Nov 2025 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2GIxjzEPgQtngG3qU0WnH6UZPnhzUOgfRwXYNTAgcQ=; b=gDxBbaAqvbCZPi0Y9YWQnqxOiD
	tk8fxDA6oJaLQ6FiTfo00cEv/N1qWFR/aIxaBq/SLhMWc8pLplvhhCaGcouj9MIgoyw29OKo1ivQB
	f50WGl0I+KLMYSS8rSkyyzqYsrxxaVpMwe1QJ4CBXz1S41705iqK0Be0Jr21FdQr4lCGSeS0miIoa
	nqUHUXGG1Iyr33ZWFZtj7Q87xa45j58lTqyqw4rbKOX+ie5rNlukukl0f/BQ5L6r8V3fzIc1rawJR
	vhQRWBbXrULKLxNeLc1MUhoe1NTFyf1LIiIyi6X2GGOyamAOUCTxcuuJh9h+wcKaj0k62/I53KhzI
	UE9YvhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyby-0000000G7DU-1Hp6;
	Mon, 17 Nov 2025 12:45:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKybu-0000000G7B3-3ISo
	for ath11k@lists.infradead.org;
	Mon, 17 Nov 2025 12:45:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2S5A3916529
	for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 12:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2GIxjzEPgQtngG3qU0WnH6UZPnhzUOgfRwXYNTAgcQ=; b=b5Zq0zE+HoTRx7U8
	Ga+WXsu9BEEPjmBusOHFWVBmLXW3BSW2uw44nr843afrfN0mxsII8nzAxMSHI8oj
	ehx9lkwRw9jkh76b6Rwv//xgQ2mUlKwv9QOyBGpjujC11LtgBxZGaU1cSa8y4tsu
	1KNilYP/9ar1T6dWQGjrJzCQxD0FtYLLFtP6gH636kKbOse+v75RgmngtrxDBBIQ
	ROu72b34H5K26MWZqPnsauXscNBxnU57ApIF+EQWZRFkAmee94RhzsFbfizJT/zB
	ItN0d2Zlc7VVbgDpaVY7Y+lB5vkrAkIqL5gMl81YrkjTouxvRyHqOST27MCpjjIm
	hqlIMA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx89gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 12:45:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b873532cc8so4932490b3a.1
        for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 04:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763383531; x=1763988331; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2GIxjzEPgQtngG3qU0WnH6UZPnhzUOgfRwXYNTAgcQ=;
        b=i0eN0GYE9h6CWU9sprflW94F0uT+wGTg+tGN0Vmyeoj+oBqECJ7aSP8CcFPhjQSZEl
         YDPIaQV74jsdH6LXYPTPPg95PzaA99o/xY+rjunFGyvMR1+kwyabxZcxMt0AXIBgDKGY
         1XmFKnQyjhApJu628qlFpAUS60J9fcVx/GK11xqEsD684MJ4H3xnwp2oJg+6OaJTKC8V
         fjM6BvLX3gS7YcTcMelZRygis1WS6YQ04jyCehB0YVzE7zJxn35k9HUgWTUryEnIEOT7
         ZS/H60+8fXg3OBJfb0gb0BJaXWLmvydnCgHpZE/8XKai92KOgjePbtPGMAL1MvPIzjSE
         c74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383531; x=1763988331;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2GIxjzEPgQtngG3qU0WnH6UZPnhzUOgfRwXYNTAgcQ=;
        b=ZHSkyYs9tJlkJg0gG+gj+TSKSwvIE0ksx3Htrc/wMUmfWFGRWnSgM7V+2lbdXDcCua
         wrBeqZcHH4cc0ejiQ4R7gjiVxvzexEFktPCIAgGnIizvgPevKUHAyTImOQQEyHH2bBXO
         7wpzftkkm4DDpVwjVPg6jWZKG1UHymjp5u5H/FDxXErX2K7oR3jT56joW+2jhZ9znMF2
         RdImM2Bm2DpXd6wG0jcVMoGiaIP4sIk5EHk0jsfeY5cP4dICODvgQ/8x7IDRJeLUua5N
         ZlFdt0Kt/4ciHWzrOOw1BIKWefmQqZj2rhMVMqQByRLjViRkanDkgL5a3y2uFOQ+hOZp
         QUhg==
X-Forwarded-Encrypted: i=1; AJvYcCUWCSzbS8JSWFsWIZ4vTvnO+cO8vYspV0V2Czs/+A4WgOAIflnM1BNjK+OGPwJDUfxiqmnVubw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNKYed1MjeNOKgfyK6PswwRGlEYNDDKRWaZjBJsRBzfO0E9mf4
	MMnF9YYIt3QwaLIR+LETRAEbEhxv0yXAD4od6/Xx4v+Sd9/FEl3dyEvR1PnqlH/a9OIvZuEWVa9
	0jWYhunSCS21JwuFmDt0GACUbU5zhtNNAGBxhOsjcGNkHluQBtxmlQ7EhWztbCFKA
X-Gm-Gg: ASbGncv4Cy0Vf/2ahCZ/X7JgYhB/8VradP1k148lPix/AeX3Puh0uF7XvTz5IBfjRUP
	f0mHNjpvQXbM8/sZT3W6ipYYNTldDIxt3q8tpU+E/K4EuXHBoc/+XCVuBa+5ERkU9KJJtlpyOdy
	b+sIhVvWwUx1THbVU5UB+k7gkhLg72J3ukFXoO9VEZqdCHQrRs5XxUcNE54IXAtNDtEWF5sD/f3
	3fjF+vekbZUbZdy88oCSyLSb+CdhSHFQtMe6VWuLfrp2FjnbXy4G7/rMOpLkepdmQwTGe4LfxLT
	Q8s0+7CY7pzPN+q/QZCOikYiP9B0PnUxP8UPlfH23p/lqvc0tudivUgndiuF/2V8CL8rCdhSihm
	lXEgJFWJVJuAm
X-Received: by 2002:a05:6a00:148a:b0:7a9:7887:f0fa with SMTP id d2e1a72fcca58-7ba323d6167mr15472536b3a.1.1763383531500;
        Mon, 17 Nov 2025 04:45:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDJbvN6jOsObid0beCDZHvRVXCcF/Syx9OjNHftPL31GJDCaNOSy040plNENpYw9lQsUyY0w==
X-Received: by 2002:a05:6a00:148a:b0:7a9:7887:f0fa with SMTP id d2e1a72fcca58-7ba323d6167mr15472502b3a.1.1763383531025;
        Mon, 17 Nov 2025 04:45:31 -0800 (PST)
Received: from work ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c23103sm12814553b3a.65.2025.11.17.04.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 04:45:30 -0800 (PST)
Date: Mon, 17 Nov 2025 18:15:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Message-ID: <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
 <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GpeutQqRbBaw5Us2IORr_bjgxUG4llQ1
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b18ed cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W1PEZSGAYdG1hK9pKucA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: GpeutQqRbBaw5Us2IORr_bjgxUG4llQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwOCBTYWx0ZWRfX65GgEmDYUDIY
 7tVSiqbytpppLqPkc+zM4iQEnQSLTtC/usaFydBW+vVa10VcTf7MMNnngqnArdAIqOI5M9qfkYR
 RzNRdRtkUaIAK7Ic4JyNm+1svRkzmtQMZemQw8wzmR65Xj70HkI0rzCnq2eyTOIh57eN1/fjmWK
 nDttoIjD2hR/tiswa1owHKhgkgQ+SFCFsqPeneJ9ZDMZm7+Do7BTRekySyAfDUjZkGMbNWB3ffC
 L9uCC/NP5cJey+y4v6jDCBOWN0GJ4NUUPMToTLUMIDGpl6MfHdwojDEm1RVTx5ICuxAR1OWT0Fg
 OPFhZ4mEhVMdxSY0ZBe1S3xPpD7/DFtGau7VNQ8bmaYIcIO9RrR2q39i8LDpiWiERgF6zirqiBy
 vb2XVtNd9R9eHShmfchhCIg/IrRhNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_044534_954637_AEC43D9C 
X-CRM114-Status: GOOD (  40.96  )
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

On Mon, Nov 17, 2025 at 05:40:06PM +0800, Baochen Qiang wrote:
> 
> 
> On 11/17/2025 5:00 PM, Manivannan Sadhasivam wrote:
> > On Mon, Nov 17, 2025 at 10:36:39AM +0800, Baochen Qiang wrote:
> >>
> >>
> >> On 11/14/2025 6:22 PM, Manivannan Sadhasivam wrote:
> >>> Hi,
> >>>
> >>> This series aims to deprecate the usage of "qcom,*calibration-variant"
> >>> devicetree property to select the calibration variant for the WLAN devices. This
> >>> is necessary for WLAN devices connected using PCI bus, as hardcoding the device
> >>> specific information in PCI devicetree node causes the node to be updated every
> >>> time when a new device variant is attached to the PCI slot. This approach is not
> >>> scalable and causes bad user experience.
> >>
> >> I am not very clear about the problem here: is calibration variant device/module specific,
> >> or platform specific? If it is module specific, why the lookup is based on the machine
> >> 'model' property? While if it is platform specific, why do we need to update devicetree
> >> node whenever a new device is attached?
> >>
> > 
> > I think I mixed the usecase of the 'firmware-name' property in the above
> > description.
> > 
> > But nevertheless, the calibration info platform specific, and hardcoding the DT
> > property fixes the location of the WLAN card with a specific slot. For instance,
> > if the board has a couple of M.2 slots, users should be free to plug the WLAN in
> > any slot, not just a single slot where the property was defined in DT.
> > 
> > Also, if the users plug-in the WLAN card of another vendor, not Qcom, this
> > property is irrelevant/wrong.
> > 
> > PCIe slots should be plug and play i.e., users should plug-in any M.2 card and
> > expect it to work.
> > 
> 
> correct
> 
> > However, as I learned from Jeff, calibration variant property is also going to
> > be required in cases like router boards where each slot is dedicated to a fixed
> > band and the calibration variant is going to be different for each band for the
> > platform. So unlike I thought, this DT property cannot be deprecated. But going
> > forward, I'd like it to be used only in these special usecases. Most of the
> > upstream DTS have a single calibration variant for the platform and for those
> > generic usecases, this static table should be used.
> 
> If that property is not going to be deprecated, should it take precedence?
> 

If you mean 'it' by this static table, yes, it is going to take precedence as it
should cover the generic usecases. For special cases like the multi-band
routers, existing DT node fallback will cover.

- Mani

> > 
> > - Mani
> > 
> >>>
> >>> So to avoid relying on the "qcom,*calibration-variant" property, this series
> >>> introduces a new static calibration variant table based lookup. The newly
> >>> introduced helper, ath_get_calib_variant() will parse the model name from
> >>> devicetree and use it to do the variant lookup during runtime. The
> >>> ath_calib_variant_table[] will hold all the model and calibration variant
> >>> entries for the supported devices.
> >>>
> >>> Going forward, new entries will be added to this table to support calibration
> >>> variants.
> >>>
> >>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >>> ---
> >>> Manivannan Sadhasivam (2):
> >>>       wifi: ath: Use static calibration variant table for devicetree platforms
> >>>       dt-bindings: wireless: ath: Deprecate 'qcom,calibration-variant' property
> >>>
> >>>  .../bindings/net/wireless/qcom,ath10k.yaml         |  1 +
> >>>  .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  3 +-
> >>>  .../bindings/net/wireless/qcom,ath11k.yaml         |  1 +
> >>>  .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |  6 +-
> >>>  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  2 +-
> >>>  drivers/net/wireless/ath/ath.h                     | 98 ++++++++++++++++++++++
> >>>  drivers/net/wireless/ath/ath10k/core.c             |  5 ++
> >>>  drivers/net/wireless/ath/ath11k/core.c             |  7 ++
> >>>  8 files changed, 115 insertions(+), 8 deletions(-)
> >>> ---
> >>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> >>> change-id: 20251114-ath-variant-tbl-22865456a527
> >>>
> >>> Best regards,
> >>
> > 

-- 
மணிவண்ணன் சதாசிவம்

