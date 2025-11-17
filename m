Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E25DCEACEF
	for <ath11k@archiver.kernel.org>; Mon, 17 Nov 2025 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l654H++wrDIKhs+Oc2+S/1MIjCYK8NtPLyiTdYbJ5eY=; b=wqQUbgKhek7CF1O68DXLMC3HE+
	auaZnMi5zXnwnqiUGfNNwQwBugwnS/ifCx73er23DInNkr97I9XtyFnMsBK4+Iwn8YKuzPVkafwV5
	+ffAcWWiEGXALhFXYJj5eTngxg06EVtBAaJDiH6/yYhAO8z8rGs+tehMap+de0vj4vZgoWMLQdZf1
	Py8g3+1Ve2jj91Fer7yGKzN5d+wZoapwFjSg27ZVlt1hwf3aZ+rJKBobrwDvo/JzZ8rTOXv9MIO0y
	fozC2arbO60so7/o4nfO4fs3AggbUPKLa+KAp1FFDAAKhwo+QT4gyrPW9CMpj0XyXx7oLbAIl7wiA
	o9g+gdhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKv8u-0000000Fjam-1gHS;
	Mon, 17 Nov 2025 09:03:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKv8r-0000000FjZJ-0YV3
	for ath11k@lists.infradead.org;
	Mon, 17 Nov 2025 09:03:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nxnS2686252
	for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 09:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l654H++wrDIKhs+Oc2+S/1MIjCYK8NtPLyiTdYbJ5eY=; b=g+i6tsE1I3TokNcC
	xoXFTu3nj19oy2f714qq/GoTofyV8Rx3bpt1WU047aU7/WGedHVqZK0cG46xrYUZ
	O1NfU7ixAll4BeOk+Ym4jSiZ9Fe95OJWEuzo8E85KTY/BrS4AXRS9yqKMIrTmG7F
	F0VprbD17e0E1UF29WGFFlHkWqO/I5j9OfMEFU2Q8XgK04+ZI0g94gQFyZOT2O+0
	QK2cNKmn862pjLM+uLW7cWPvNdWzPJk6UDTTGXf96dxt7WI9u/Bro7aZYUbgRoGW
	KaUcXbPaS+IDrWZOrKrn+oHJFYiXc5uQoTWhr2krUr4jVBOwPb7txeSlLMLEJ1/k
	7JVm6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejt5c07y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 09:03:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2958a134514so53927355ad.2
        for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 01:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763370200; x=1763975000; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l654H++wrDIKhs+Oc2+S/1MIjCYK8NtPLyiTdYbJ5eY=;
        b=YcA/aqj0m8VYyXkd79M8kBKtJZ8ZHjatVgTPS3GIvYDY6JsxrmYbVhtS6mxEkDUQ1I
         R0un6OZ6jDdQ9hbeVqX1KJ1AHK1IdXwdi4ivi7iJ/qez20aWsYqJMbixgMJDhCoeeYBl
         /gQL/mJLAAbePMmv9MYzelEA1WjHUUc8oAvZ0oenzEFIhgecQwpLTYkLn10SSZsAXpgK
         YHcSX+96dfHxVRrOS+zYMkdSv2XaiNlpGvbVlIQlHJJ6s8tUBZKbWDPKo2EhaH874l+e
         1ytlCexAjVk3xQFf17iVY8Bo/YiZYVNFoXb8ltI359CcbmF2bcSw4fBE6MVdr3rEuOg7
         Ktjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370200; x=1763975000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l654H++wrDIKhs+Oc2+S/1MIjCYK8NtPLyiTdYbJ5eY=;
        b=c5f4kZbXMZwLRCl683EkLmZMG9Ig1RIG3J8Xz9pKcOSzf+ga9sSy3knJsd3miIHiTJ
         tu3wIaDF27wHmqehUGeDaX9JVaPPENSwz6hvnrm9p2FPH0DvObXDlBuafunuH9MMH16e
         zRaQrv84CnPu0tbRf/5S5sRUNwgWyo+eRYDN0tUSI8dipwdU3BSyc70qYNHWMqSSF2u3
         FbXwyFbbGBhdT2NTfMylicfsHU0NVCn4TgNhtFhU1AtYlpNGZ1uvjKnDii8mltSntluZ
         mILxxaJrVKWA4ZLgf4SwVlDsKai99sw4x03sx9KqfHCoph10fTzPbY+00si3n66o4bcI
         FNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkC8W2EQyzkIe8QK3YBkoq3DgnRncmLBuX+M7ZizNituRYuCgub/X0atFsJQA1zOFckIyAFSQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqLQdXGRHngCl7SVVDZJuwT8uP9EDBtowXh8yQZJIN3vmSGgHt
	KR0bVmKEeXcYsQhpR/amCvZGdls1ESkNc1I+rb3df2y6kuX0aWczEJmnXW09NzBUrOgaZ4X1z2k
	5u9rwuf1jPrSb9eHsDPh80+ZOp4owLZWrsSY7P2rINTJBfQthCCWkfHt1XrPYBl2L
X-Gm-Gg: ASbGncsXBA9cbFoBEW1Y5YInZGc6H68FFf3Lwy2Sl7+njbdnJbhaTLr4rteE7plQueP
	9XzJjeBy1r5+4apCAYGc+PMwhroRsE+zJx+TBhBNG50h1LwrMAO9pnpH7SVvJ1tPkZGX9YogQ41
	6OUPRR1IuXlVqjRIIaVQhNlYJNKH9Q9P34tzLsrfuVlb9Fp7GOjECJGEYldWOjnCLUMpQUyQXag
	mRmwyARr/9Rnuz+7DDQm3EB24o7JozKhm06rkNMTsCcSWpkqcQ/QCLH5/HqwxWJlSUbd/YDb1sn
	pmwfm+A2V7oIVEaiGSe6G2zxU728+fpkmWhqneNVjrgfegbvmhL1dquKb6L8UolggedHF4kfwYm
	DANNTjOfqgba5
X-Received: by 2002:a17:903:2f88:b0:295:8dbb:b3cd with SMTP id d9443c01a7336-2986a6ec9b6mr128086375ad.27.1763370199677;
        Mon, 17 Nov 2025 01:03:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFV/ytKTe+tDWjtXCC5OfPxzLvXpbLuv9zHdmNqMNf952FZHcVn7M15VmQeRSV6ylQ2cAqHw==
X-Received: by 2002:a17:903:2f88:b0:295:8dbb:b3cd with SMTP id d9443c01a7336-2986a6ec9b6mr128086065ad.27.1763370199146;
        Mon, 17 Nov 2025 01:03:19 -0800 (PST)
Received: from work ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0c57sm132940035ad.54.2025.11.17.01.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:03:18 -0800 (PST)
Date: Mon, 17 Nov 2025 14:33:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
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
Message-ID: <tratduwv3edhhu2wjqorfkahpuwusx7uvr4fdgzo5wwz7rzdnx@iyxp2nc7ksha>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-2-a9adfc49e3f3@oss.qualcomm.com>
 <b9b4f1bb-45ef-404e-b75e-962e85a557a2@kernel.org>
 <fmumja63j3xvbvfxlmtnkfubgw4jwo5f43srrpfgqrxyqknrj4@izsqazgbiehp>
 <1703d8d7-5105-4585-b8f0-82bb54809718@kernel.org>
 <kve3f7zkywwsfkylom3jp4e3ejlspnlvnmlkuq77uy6fqsy5dt@gaitvppj2jcw>
 <7757501b-2576-4f5d-a16a-40e06f12cb5f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7757501b-2576-4f5d-a16a-40e06f12cb5f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LqmfC3dc c=1 sm=1 tr=0 ts=691ae4d8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cS6S4_kxOddRYArucPIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: w3gofA2nf6IPwFbrYlBBCpOiU9v45FTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA3NSBTYWx0ZWRfX5rahkppVibdd
 oewAFP0aZUZHewGCQKpx0I7yhzyy7dwJGJ68McOrGYpC3lKQ829m8QdNI/ajO2bmOtu+NC5K+mI
 xkyyPMzvfmS8C6lI+yKlQcmKWV/p8A3gfgVYBSsq/L12t9wK71C0hZuC7ff6kXE+Rf45HxkilSz
 PEMcigmYzAFC7cvOfpdt+Lrqf2XTriUMhtgZCGWtTv/gQFTFMbfEUI58xwjiCb2QTsfqhI5mNU3
 od38kkS0N99E1s0EuUxkcilXNiGhkx3am3nmtlEQGtrII4Y7KOk6OPyiH70Hvdcctr1Z/EIQ6Ee
 K4GtSHuBLuNhaXwpCSDsP6TD5Vf0YjhWp/b/wrWxUHj1T8452kE0g5hk7HK78au3ZHUN3rRwBtn
 BIY2arfFRovKm0ZRfeIon4A1Tiqs1Q==
X-Proofpoint-GUID: w3gofA2nf6IPwFbrYlBBCpOiU9v45FTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010321_182832_2CD2BB70 
X-CRM114-Status: GOOD (  30.27  )
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

On Fri, Nov 14, 2025 at 09:29:46AM -0800, Jeff Johnson wrote:
> On 11/14/2025 3:18 AM, Manivannan Sadhasivam wrote:
> > On Fri, Nov 14, 2025 at 12:04:55PM +0100, Krzysztof Kozlowski wrote:
> >> On 14/11/2025 12:02, Manivannan Sadhasivam wrote:
> >>> On Fri, Nov 14, 2025 at 11:47:25AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 14/11/2025 11:22, Manivannan Sadhasivam wrote:
> >>>>> On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
> >>>>> 'qcom,calibration-variant' property to select the correct calibration data
> >>>>> for device variants with colliding IDs.
> >>>>>
> >>>>> But this property based selection has its own downside that it needs to be
> >>>>> added to the devicetree node of the WLAN device, especially for PCI based
> >>>>> devices. Currently, the users/vendors are forced to hardcode this property
> >>>>> in the PCI device node. If a different device need to be attached to the
> >>>>> slot, then the devicetree node also has to be changed. This approach is not
> >>>>> scalable and creates a bad user experience.
> >>>>>
> >>>>> So deprecate this property from WLAN devicetree nodes and let the drivers
> >>>>> do the devicetree model based calibration variant lookup using a static
> >>>>> table.
> >>>>>
> >>>>> This also warrants removing the property from examples in the binding.
> >>>>>
> >>>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >>>>> ---
> >>>>
> >>>> The problem - visible in one of the examples here - is that one board
> >>>> has multiple WiFi chips and they use different calibration-variant
> >>>> properties. How do you find the right calibration variant for such case
> >>>> based on board machine match?
> >>>>
> >>>
> >>> I suspect the legitimacy of the example here. I don't understand how a single
> >>> machine can have same devices with 3 different calibration data.
> >>
> >> Me neither but I am not the domain expert here.
> >>
> >>>
> >>> AFAIU, calibration data is specific to the platform design. And I don't see any
> >>> upstream supported devicetree having similar properties.
> >> Deprecating these is fine with me, but I would prefer if we get here
> >> some clear answers that mentioned case cannot happen. If you are sure of
> >> that, please mention it in commit msg.
> >>
> > 
> > I'm pretty sure that this example is wrong. But I will wait for Jeff or other
> > ath developers to confirm.
> 
> As discussed privately this is a valid example. This is a single-band chip. So
> a tri-band router platform will have 3 boards, one that is supporting 2 GHz,
> one supporting 5 GHz, and one supporting 6 GHz, and each frequency range will
> have different calibration data.
> 
> So we still need to support slot-specific configuration in cases where the
> slot to board mapping really is fixed in the platform.
> 

Thanks for letting me know of the multi-band usecase, which I was not aware of.
Yes, this property has to be used for those special usecases, so we cannot
deprecate it. But going forward, for the single calibration data usecase (like
almost all upstream DTS), this static table should be used.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

