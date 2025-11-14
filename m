Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7B0CE7AAB
	for <ath11k@archiver.kernel.org>; Fri, 14 Nov 2025 11:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=; b=IlZQ8WnavJjbaTmT9jYmyvUdNV
	69NFOAYQOqndydQm5UOSYhvdulOqGOG3DAvEUrfNrQXfko35n1AzUrwesLgPQe8wpf61loWC0Jg20
	yWyR5H9iZcybd2N9MnlB5DlYzlCazqiP1GrTOvnxvJNmq9Ew7M/31EUoz4IM/A7ccDdWwubF2rmuJ
	+i1Y0DpSUFvXaLe10NXrPJ0lsx+IFeFujkjo0h/Hr13bD4Nk+irjrUC8+TUX8ncpl2Mm/E4ACmwXH
	C0ZIeyVLUhH1X7aWGnTlkfLL4fI5LzBg1yJkzZh7OndrqFablBeRv9A4OJlVIPg2Cw9iYG6+GVIAi
	rbw54HWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrZZ-0000000C54a-3rLR;
	Fri, 14 Nov 2025 11:02:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrZV-0000000C53A-2FFb
	for ath11k@lists.infradead.org;
	Fri, 14 Nov 2025 11:02:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE88Qhm1745323
	for <ath11k@lists.infradead.org>; Fri, 14 Nov 2025 11:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=; b=XjjCXc00U1MwFPzf
	8bPPHsWCyQ5uSogsh0zSw2ThKZS76fCn40FGGtJeALNAAYSSKj76lMBJC8u0q952
	5lL3OLSXFGOL6PacJrFI/3RhHasEqtwf6BwHOxPZzcQwyQp6XdTayZ80M0SOwKQU
	vCnLXlZDysKwxYP/xXcuRc3dH6/cjt0Vg15aZyjNEdy0XH4tzDN9Mr+Ftr1FoYnU
	28onChHHLXvVZtjto2OITSKMb74IIeW/8vvtrbKh0xNHC/ehu9c8PUM3yCkUDZTR
	fY1tINRlIjG3VF7IcK4jLY9t6IciF5bqyyxorzMqqt734aFRE35i583bJgpOSGG2
	S4e/Zw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ehx5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 14 Nov 2025 11:02:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b90740249dso3773802b3a.0
        for <ath11k@lists.infradead.org>; Fri, 14 Nov 2025 03:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118148; x=1763722948; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=;
        b=gjx0EfpTZueEcVMsAIpbA19SqRqn1Q7PIUwASNZs8udY9UxxnvLzZae+9hZR7llaEn
         FhbRQf+kbuuZwavDZhPP5330IMK4yV5BjD/MRU+Yn7sNw2KjRqeVDKs+l3Gskmnle4+3
         BGvLsKxRX5NX/Kg53bxlu8RwDTKpEW4Hx06Vr3Z6hxAodBlVbW0VMq2YlodBzejzdCIr
         aP8dESado24s0H9pUgW7RXSHfJVdbxJpopVsIWiHzGP7OEooavBGw+edaWy0jxtSS4Gq
         nAjsapqtEDLmCysuBH9Bp/noFBwnS7LW0nQuRllwtlJRwKImXaxHDT1XSEREPvP90+p/
         bH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118148; x=1763722948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=;
        b=LKNl4DolhIyeeAy4cNVZeZsEwFBn1uJ95g1QA8f9lFAOxiy0z5AY+bxlCcRrKubkTY
         VLusPvL22NsI7HKHshi3AMrli2lC6/HJxCciFRmHQi4KA0jxPJC80L/YBazcPPZik1oI
         l+c12sfXTWN8uojTPumQ2cx7DXn7cegmNaSqfdoRXNHC9pkvrabU44i8GbXJg/oIBb2Q
         14d3mtULOU0crCU9sGw+9ne3bu3yEgdPXpkgrUITLSg9l2fE/o/DimDMFq2lRtZCUVjZ
         EJzop50E1k/Ckc+BXFLO21XdG4VdxiaCFrD6VSpxQqGY9t9I2gp7E0JG8ljRkd8T21F6
         BQGg==
X-Forwarded-Encrypted: i=1; AJvYcCVap6kpe1/edFYcjidqPWBjmnnNPrh4uPSyx01GVlt+NDKrTb1EMKnJKWYkAipbqamFc1cxhME=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHsqMAe8OBZQe2JvGIQJbx9Pm3jRj5Mr4lxuSvysMkO8+KQUKw
	U0EjUYbPoJ8WrehVBd2D/Hx3opTpcdRXEOZWhJYN2pMschEhO3IyjqX3t3/bWpckikq9LqfOJA0
	9/Na4cLeTpWk4IEUcX3zwB2azAFDsPYQgs70aaBnnL+vDjuCNDw1+FL3/7NKF+Dig
X-Gm-Gg: ASbGncv+eLgEk9MIgY8eE/QSYJBGiq1o6AWuxvceypclOZ5N443HDOlV60f5HPFj2io
	CQIRmDo2AsQYc6N3rrya5Ws+MmRd6+V4Yr6mILqWj4rVfI17mSFyY8Gb8hnOBXnylr5VDs6b8pA
	S3dzWlgNmUQhLr7vnYzsxNibzHsEi7VnRUVJZxEYLDOIyVqsDzsRGOuwCFVdPYZxZeNgHA1C5Z2
	tuTcnhilXx+AjvMnOkSOzGPn5XW6c024sX01jEt44c/sbHyR0nTL56fhONZif/JW1/Z6kxer2du
	+P/J9fSMQYjzlKVSLqnlPcKBN07kSkp7HsrrT/9YIxaazw7HkaEZzqGpr2oIhDtWEaJGhmWnGr0
	3S7EZ9zDlXUBUubY=
X-Received: by 2002:a05:6a00:198d:b0:7b8:9d86:6d44 with SMTP id d2e1a72fcca58-7ba3a0be249mr3281996b3a.9.1763118148336;
        Fri, 14 Nov 2025 03:02:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExFNYt2MskO3W88XzfwFL4ANOFXf0FsrBkggPFobNWhKgZWFcTDPQBJLVYzM5f0k3sKC8ZFQ==
X-Received: by 2002:a05:6a00:198d:b0:7b8:9d86:6d44 with SMTP id d2e1a72fcca58-7ba3a0be249mr3281959b3a.9.1763118147841;
        Fri, 14 Nov 2025 03:02:27 -0800 (PST)
Received: from work ([117.213.102.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9256b8824sm4884070b3a.31.2025.11.14.03.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:02:27 -0800 (PST)
Date: Fri, 14 Nov 2025 16:32:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] dt-bindings: wireless: ath: Deprecate
 'qcom,calibration-variant' property
Message-ID: <fmumja63j3xvbvfxlmtnkfubgw4jwo5f43srrpfgqrxyqknrj4@izsqazgbiehp>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-2-a9adfc49e3f3@oss.qualcomm.com>
 <b9b4f1bb-45ef-404e-b75e-962e85a557a2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9b4f1bb-45ef-404e-b75e-962e85a557a2@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NyBTYWx0ZWRfXxGC++KA/UU6S
 LEQjGzB/CRvGsC0m7YY+EL1e8c3xwDNB9BpQErMoy21kdYbWebLxJ/Xy4Pue4sbAKBoIbDKNr8W
 nfUVSo0WRTsEp8Aoa6LnTMhoke7vF/d2biwSyCzXNf4p+Ln+cbRfRt6XvFt0VL6CyV/p+g86AKc
 lsi8EvTXc36WBl2j2ZEw0iNeHoCIZGGj45q/3aMQGO6PJdpWdxe6zcr3CTt6souP9nHHyvoi4pm
 nCWhQpor9BleP5PR29ScRahg8mPCQWLrDzpP+OXjL8PbdhNlBow44bBmy8hBQl57xS8joGKgDMG
 53OPBYoRdbNNe6K4yk+HIOnt+LPFQngVIZoSLhcsXFTWDTzMPxQS5HlAFp+8fBGd/2XL17ZdAQi
 B5TEU9hHPXYhe1xuStwcc+eubhyTWg==
X-Proofpoint-ORIG-GUID: ZuN60ylU3dGC2WuyN6eFz9V2x9amUY8P
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=69170c45 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Nd/jlyMbCgud2ZEcqXkYLA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iIcxu6EjtSR0Qi8y410A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ZuN60ylU3dGC2WuyN6eFz9V2x9amUY8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_030231_156760_64B5C948 
X-CRM114-Status: GOOD (  22.74  )
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

On Fri, Nov 14, 2025 at 11:47:25AM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2025 11:22, Manivannan Sadhasivam wrote:
> > On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
> > 'qcom,calibration-variant' property to select the correct calibration data
> > for device variants with colliding IDs.
> > 
> > But this property based selection has its own downside that it needs to be
> > added to the devicetree node of the WLAN device, especially for PCI based
> > devices. Currently, the users/vendors are forced to hardcode this property
> > in the PCI device node. If a different device need to be attached to the
> > slot, then the devicetree node also has to be changed. This approach is not
> > scalable and creates a bad user experience.
> > 
> > So deprecate this property from WLAN devicetree nodes and let the drivers
> > do the devicetree model based calibration variant lookup using a static
> > table.
> > 
> > This also warrants removing the property from examples in the binding.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> 
> The problem - visible in one of the examples here - is that one board
> has multiple WiFi chips and they use different calibration-variant
> properties. How do you find the right calibration variant for such case
> based on board machine match?
> 

I suspect the legitimacy of the example here. I don't understand how a single
machine can have same devices with 3 different calibration data.

AFAIU, calibration data is specific to the platform design. And I don't see any
upstream supported devicetree having similar properties.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

