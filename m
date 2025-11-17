Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D2ACE8D6B
	for <ath11k@archiver.kernel.org>; Mon, 17 Nov 2025 09:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=; b=eVcBrYQyboi7kGteCpfbLfo7OQ
	jYgJmq/qunL8p8KI/NdFjJGu9Nzz2FbG+b+bSgfMTdLaWGt003as9t06vIfsfFm6evA2xXIdKSEXk
	EPPhz585C9oX1t3+RRMtEgncxGASnPSNi2nTJu2Ty5QlA7hezbEeDmMp1mbDHBYwrgdelF7TjoXpc
	ZDdJ8i5dDoVsYXf3oQzM6cWPMXvpgH85UpB8h19SmyCHadUZ+QcLHu2bnzLcFzap6ORyg3yti99Gv
	XZQhjvNhdEBBD8AOAs/2y0HiD9xFBT+DG4wzAQFpSJYsXnJhcZdhUVGVVgVgmRQ95jQ+tlwKylJRQ
	dGmRsyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKv6W-0000000FjE9-1kQa;
	Mon, 17 Nov 2025 09:00:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKv6S-0000000FjCH-2GhM
	for ath11k@lists.infradead.org;
	Mon, 17 Nov 2025 09:00:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nt8X3081829
	for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 09:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=; b=CPBjihyMHTLRrjQj
	4XHfLEacuQ6JFr9+VGc+ghla7bsIHF6CYow/WPU8FRlxZlnQO2UmfTzhvNaV7nMn
	tDGsGr8GNsv3hOYWh42aGdAEgn3sWBrkGmXxvtaNdqRdz95eegbbXiVUKnQbmwG4
	S48llXoTy0zMk3WO/C/foDUaJ7d5OI/xHKOummpHT6x/C/Zr7HZKqt9FpP7IYfHv
	YNT7/X2KTu0N8XJ0jn+IrCe0JLZ7NDzWluP+Pyr8eQVqbmfzlQhwN52iLtj1PKcA
	zTAeWGWu/wKvuK4sArEOzHmndMLq2HCZF2kQlsoHNn/kcVe2yxwkcSGKZ7eWi4xS
	BepaxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejhr3yfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 09:00:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297e1cf9aedso105692045ad.2
        for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 01:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763370050; x=1763974850; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=;
        b=P9gnQVUK88UlJGMuMaGz1k4rIxyUvkQ5xe3ux9jkIFm2C6XdNfonkls+8uh7DOGJea
         q/vlYne4SJBOOvAlabr1jYzHIoozxlhwXIT/c3KJPg93iKMty0nAX9jl7TGUBBfrksoA
         uLywkgbo7jlF6HEf9CjVVasEInyjJATK0TD9snUHSZO10zGwz0hK7rWDFJMNwJ8Vh6FU
         ELtzc2PT6Y2hr0jWYP8x88Z1HRsrO8T/IVSkdVi6z+MtP3HDk2hH24qPF0TbkcQFMaGZ
         bSCncnxEL/OGbVLwQMAcpsTZbwx6o+vb2HonTgM1NTNs0HGc6dXMN4ONN88x7pDlUE9P
         diAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370050; x=1763974850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=;
        b=vQpA1kZ4kXjInzm6ADRMYl2QoJrud2vQArIRhEsyBbC3RFGMi3FiwJQd6vxbmLOHIc
         bQg3UHPKS0+1vbfOxU0VwTJCRnw7YBICoBP6rP3uR14gYPf6hLoFSjWcgDXpny3OYFV3
         Fre6p/iwJeQ+y82/rQeqd3BDaFLwzjIJhGmRebzp53wRvQqGKasvTAjJUcJ2r52gxGre
         BULoMOMpzefxauU5GoB+LeKHYS29Q2frWMniKXrFtaXJCPn00WkrIgo/fR882ZsT837H
         X7u64PqCsX09vsLhvy56H9QhLiiJuYRw5jMNi+f7JWt60GeEQG9XdovStPi9tMK1kkK7
         w+/A==
X-Forwarded-Encrypted: i=1; AJvYcCUoL1zZxo3Gq+fO+u3VTyhEjyMGXpPl6w0jStu5RRF6vPu2lLFxpJ3PJgpdLzh4yv4OoRKZ6gM=@lists.infradead.org
X-Gm-Message-State: AOJu0YygeTioJ+znD5JfV9CpdRhhPWPaZ6N70V5pmgxUeTTbcnHWijQW
	hxKuYo1qP2GcosR/6I+d8LOyOKFAuHYLdrvHqy3McCpxa6eMujb/Gi4Qimyj91v8+4kJvX10G9S
	P86r+DiEu/ThNPqERXZQcioZ7Sv0JD72kWQy1OCkSq5iel759sMPGa1KTfWRWxgIL
X-Gm-Gg: ASbGncu7D9pF3rmjWhRh27jaQG7hZfWN+Jxh0AzqVtnwBv3Wou7oAQ/E+qRX2fzyFnp
	XNEIxVE19IewFJiY+eGNwvOgRa62UgwSHxAdQu8hyuqW+QLyumrvIRV08wYrJ3lZztamQCL4wMZ
	bsew0KyOeuj2L9PapMelQ0wCuJRHR0YfeSaDPozKmEBOQZq+OO15qeK812wJY91z9Qo7NgIlSCk
	qp94hd06XQBWdAlnh5RCR13oi4U9Tyxy4HbShUEnhbsLs3y8B4MaWXp6ECCP788iPQCeKnkDCFM
	QsKRLLh20VUomdlxuazyzp4pOgBvliEXhAAagOcP2jugG6vuRlPVu7KpiCz9+8FvxNvIm0NiifL
	6/yKXFk+iSH8/
X-Received: by 2002:a17:902:e1c5:b0:298:3545:81e2 with SMTP id d9443c01a7336-2986a6bfa2dmr88167975ad.22.1763370050057;
        Mon, 17 Nov 2025 01:00:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnrNdIz6rZtkHkqRUVqdF32sENFrtojZo1qL47E8dcBWurjeZGz/LHdZ+VRed2ABXDGYua7w==
X-Received: by 2002:a17:902:e1c5:b0:298:3545:81e2 with SMTP id d9443c01a7336-2986a6bfa2dmr88167425ad.22.1763370049309;
        Mon, 17 Nov 2025 01:00:49 -0800 (PST)
Received: from work ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2beb34sm132716465ad.76.2025.11.17.01.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:00:48 -0800 (PST)
Date: Mon, 17 Nov 2025 14:30:40 +0530
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
Message-ID: <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA3NSBTYWx0ZWRfX1vEC0Mnthw7t
 arTV0dq/6mHPJ4Nmlc1Od+O1ATUVFp4Zd6eSv3DeUlxPzUdTpfrR4jqjlEt3UobZPOde920JHSM
 AQO1wit9qSUjFBQHRieC3ZYpAt3Sk8N1DPaU0NNZjCPSWJAf6ozMiQQsqywosA/THWcGCHUbwI4
 E/OYV69TLUIiqeSnuH1lirAfp+JR2K+2UJtqQ28iJRt5G6DOTTgW18wzyHIkJIaT39Kbcb1rlVn
 XGRNcJb0jowKaf+CylF4S9fQ5XKwB6O3mIPx+e+AyuqqaqlhRR56zJq+8Crl5v6OQWVYsmDoeTI
 ds7ZRcjwdyIFbkICHxxizjhBJS0OzTb2j2lXQbQzaDPSR42H5mtbJ7iO0wfDAFzKISodCNe5GC0
 kLPEMp6iUYUcAmsmv/nammHt56c24w==
X-Proofpoint-GUID: EB48VjdC_cm9RurxSwiBgaQ2oaXNoxVu
X-Authority-Analysis: v=2.4 cv=dLCrWeZb c=1 sm=1 tr=0 ts=691ae443 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rZNuoRbQ_TWyfwDSFJ8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: EB48VjdC_cm9RurxSwiBgaQ2oaXNoxVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010052_690165_569FF8D5 
X-CRM114-Status: GOOD (  33.92  )
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

On Mon, Nov 17, 2025 at 10:36:39AM +0800, Baochen Qiang wrote:
> 
> 
> On 11/14/2025 6:22 PM, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series aims to deprecate the usage of "qcom,*calibration-variant"
> > devicetree property to select the calibration variant for the WLAN devices. This
> > is necessary for WLAN devices connected using PCI bus, as hardcoding the device
> > specific information in PCI devicetree node causes the node to be updated every
> > time when a new device variant is attached to the PCI slot. This approach is not
> > scalable and causes bad user experience.
> 
> I am not very clear about the problem here: is calibration variant device/module specific,
> or platform specific? If it is module specific, why the lookup is based on the machine
> 'model' property? While if it is platform specific, why do we need to update devicetree
> node whenever a new device is attached?
> 

I think I mixed the usecase of the 'firmware-name' property in the above
description.

But nevertheless, the calibration info platform specific, and hardcoding the DT
property fixes the location of the WLAN card with a specific slot. For instance,
if the board has a couple of M.2 slots, users should be free to plug the WLAN in
any slot, not just a single slot where the property was defined in DT.

Also, if the users plug-in the WLAN card of another vendor, not Qcom, this
property is irrelevant/wrong.

PCIe slots should be plug and play i.e., users should plug-in any M.2 card and
expect it to work.

However, as I learned from Jeff, calibration variant property is also going to
be required in cases like router boards where each slot is dedicated to a fixed
band and the calibration variant is going to be different for each band for the
platform. So unlike I thought, this DT property cannot be deprecated. But going
forward, I'd like it to be used only in these special usecases. Most of the
upstream DTS have a single calibration variant for the platform and for those
generic usecases, this static table should be used.

- Mani

> > 
> > So to avoid relying on the "qcom,*calibration-variant" property, this series
> > introduces a new static calibration variant table based lookup. The newly
> > introduced helper, ath_get_calib_variant() will parse the model name from
> > devicetree and use it to do the variant lookup during runtime. The
> > ath_calib_variant_table[] will hold all the model and calibration variant
> > entries for the supported devices.
> > 
> > Going forward, new entries will be added to this table to support calibration
> > variants.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> > Manivannan Sadhasivam (2):
> >       wifi: ath: Use static calibration variant table for devicetree platforms
> >       dt-bindings: wireless: ath: Deprecate 'qcom,calibration-variant' property
> > 
> >  .../bindings/net/wireless/qcom,ath10k.yaml         |  1 +
> >  .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  3 +-
> >  .../bindings/net/wireless/qcom,ath11k.yaml         |  1 +
> >  .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |  6 +-
> >  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  2 +-
> >  drivers/net/wireless/ath/ath.h                     | 98 ++++++++++++++++++++++
> >  drivers/net/wireless/ath/ath10k/core.c             |  5 ++
> >  drivers/net/wireless/ath/ath11k/core.c             |  7 ++
> >  8 files changed, 115 insertions(+), 8 deletions(-)
> > ---
> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > change-id: 20251114-ath-variant-tbl-22865456a527
> > 
> > Best regards,
> 

-- 
மணிவண்ணன் சதாசிவம்

