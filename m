Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8126DC5DF85
	for <ath11k@archiver.kernel.org>; Thu, 20 Aug 2026 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyvVMNnSHQRd17KJq3rwbV9DOJ8cp9AOfAXyWtz2edo=; b=vCpquu2VJSivngiRh9BHNFowX4
	yLpx0Co0qJyoNhdeik6K2lg7/MxXwdzqro4ik43S8nG/ipk/emXioxZN0saVpb8c8mLUKRTTiLK3Z
	YDmwY0M+svD3Z24c3+7SXNTtXqgbcBXSZCyTEiIo9LyPnlL6UxiAn+mXfT8JYf52/lvl4x4cP0LFR
	sIGKyPaQaBZGF0aQ/sT2NZwWpU1K5r/+IKYfSV6h2ruVF/3RUcYqhuStgLgcFJdb516+N0cbO3tuk
	JFYav5U7sOMVpwOcnTK0lUPTtBD0yjasPpxH536rJqc8fOthrpQ47dMnhEtylW7BkF1W3cMwRsrMi
	a/mLcj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6kz-0000000Byb1-3C4b;
	Thu, 20 Aug 2026 17:40:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6kx-0000000ByaO-29yj
	for ath11k@lists.infradead.org;
	Thu, 20 Aug 2026 17:40:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KG89mJ3492354
	for <ath11k@lists.infradead.org>; Thu, 20 Aug 2026 17:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eyvVMNnSHQRd17KJq3rwbV9DOJ8cp9AOfAXyWtz2edo=; b=CJZ22GQZPhA2HOxv
	SSIjYKrOwKpLDnbPjkmy1agfxPk2AvUyJTmi0uYYE1vVbUIlq69+QQ84xZYNwAOR
	25gqXnymDAV4iAKrfeFsvu8Qplds9at0xjgWdooDJyyuqcZ4vsbZjkxP34l/sz0G
	AZL8pmKwkodHkI1c3mTr/s2z//jNCz7KxfN3OnWK//q35bgNE548PXvZqwNFhA8z
	LgoRwo/fbucHtNszvR+iYI78mPs5kw03u2JCI6OW87S4D4l4cUBjGIHeDiOY5Q3a
	ZskUsHIttP1TczLuqPsKKTYCaUJLErxTNKvnqA+KRBNIdFMqMeNMZkTrgTv35vYQ
	mQdSBQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29jehx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 20 Aug 2026 17:40:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so107528a12.0
        for <ath11k@lists.infradead.org>; Thu, 20 Aug 2026 10:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787247645; x=1787852445; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyvVMNnSHQRd17KJq3rwbV9DOJ8cp9AOfAXyWtz2edo=;
        b=df66v0caIzOQJGc0TSPIZhD54wJt6FLEGXlNngQ4CLYL+/NsldvAWbTsTOxByXujwT
         TNCYDhesbTW2ZbCmKOkPfnoQLmFoCG0680x5fY0OmzSZIUQe1qLFyrgAzOUlQuWHNkh/
         NGvM2Ui60Ix3+q+p5lsaJEmsLLBf7uw1xBOHsLpGcfVYUeOhdzNxh+xoUhUo92ZXzdmw
         9EQ+o0EGO5IcayCrt2bjfWZwSXRFe0bca8ljvB/foSEqDewnDh2KV/YXUQszofJ9kxTv
         5n6aAkEuiHn1RAeDe8hpYSxaITG8e2cH7EvvVToE7eyi6KF/Ty3/SFlPMUwDd4vpq4Ud
         wyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787247645; x=1787852445;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyvVMNnSHQRd17KJq3rwbV9DOJ8cp9AOfAXyWtz2edo=;
        b=gfF3dwAL1loafyBckWtohrlA6icdiXWyal9VnsUDKXvmrjJ/FXc5OpNoN2EV6uPce7
         F4G6OfEj1aSlrTcHA/v2Ex0FXM+w46tqVybFCekSN7x4IWkA8qfeNAiPv/G0iM2l9o5o
         ZVc8dr3i4XKvN88lHiLlPM5i4oP9PLyI9ZZXW0dXz658TaaFsGrylanzdiWjj/MKS4AL
         P+Zla8+3xq+OoUlI3AoYCKypVoc3e0n5weAQ4UI6FbU4M0/QZhFyuXcC6lO0SU4dGyuF
         cTecsB7l4H15HjnZlzri12KDrJhmkWYA7GcvpN5Wmx+n+8388ceaHGZLYKwqloBxlF4H
         6udQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYLN7TXGxUs+oedsoKFxOK1sp2NsKPEJMJtrIBVZc64q1VVEfjkRLGPZrEtIU8CWg6/JeEsVk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt7t0cMk0k+lSOOIbrCEr5hkZOEk+OsWyAvlst+YseXoJd4UcK
	G9/6S3I7O4sdOXlDnFy8GDlkHRQMbsRVCMyNhe6jiCJ8oRM9ZwMsBKpl4LwY51AP9kd21xmMnq6
	ZDP0tECl6tCDpSzm509J0jdPiDS65F+6gbM29KUB0yqOTZsYuHgbkO7EXsl7QzAg9
X-Gm-Gg: AR+sD13BwsXFX3sx928tULVUU19wQLmk1xlaJjc01JNIuqXarAe5PfIl1Fpa6rmntAo
	bojt6vz7HMeaq1XQIAcAXxg5RBrDt76TV+yoaK/ciPQlHFPHxmbvnPBhYZzzHZrbYuWwSKroHtK
	iQTdRS1/vkjSVG3c6Lx/ff4QXFMC5u9+GLyV8/f6hxcg+1Ayw1dBdceNtO1yv1bG23lF76Z1V+Q
	ybENL4htWZiKDRFQtZBCvc1ddhNGPX8c7BTzZB12c4GwN5AG1Gt4Jan4s7VRF+Gh+YaptVTF4A6
	CGJSzdZ/uLIwVIHoWLVqHQlDNdW5ftyFFzyedWIGrGSoj64/8pIK7l+/4wQbdSSyd11bM9FLgzW
	mv+mpXA3Sy9xFRbxTLuYkGCeRcRTjBwYTZT9Bbcy5NQu5UPDD344uxCE=
X-Received: by 2002:a05:6a21:918a:b0:3cc:841d:bb26 with SMTP id adf61e73a8af0-3cd301379e2mr97405637.15.1787247645288;
        Thu, 20 Aug 2026 10:40:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:918a:b0:3cc:841d:bb26 with SMTP id adf61e73a8af0-3cd301379e2mr97301637.15.1787247644794;
        Thu, 20 Aug 2026 10:40:44 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c3fc6675sm26861387eec.13.2026.08.20.10.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:40:44 -0700 (PDT)
Message-ID: <80f99583-eed0-40bd-856b-56cbad973912@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:40:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 8/8] uwifi: mac80211: pass error station
 if non-STA transmit was requested
To: Benjamin Berg <benjamin@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>, Ping-Ke Shih <pkshih@realtek.com>,
        Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Benjamin Berg <benjamin.berg@intel.com>
References: <20260819135703.4072215-10-benjamin@sipsolutions.net>
 <20260819155703.64912484c2ba.I5ffe7bc0d4ccefca5c1e506d5d3d482e13989cda@changeid>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819155703.64912484c2ba.I5ffe7bc0d4ccefca5c1e506d5d3d482e13989cda@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P_-3kjdyjYa3jXBznXkVU9ydoqaYeJrw
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a873c1e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=mPF9hNEBIKWWczyiqVwA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEzMiBTYWx0ZWRfXwu1+DPQYRZrX
 z4092tkJPdeHiCXtconjicKf76F9rQIsir6SVQViMiL/3rP7xV3P5rZPVatjPkDPXeUbbTQFxDz
 oAHZb2uPDs/GfF/2qIw94mqSxUI+OAZ1TG1y+10/RnSxcgJUjHd1qs8uNcV58ILRBOmkIrffbby
 KIkBSx2/JvSU0Gb4MVSwLAQi0Zdun1GZ6EVpv2YrQ3cu3kJJSrOXNlLmisk9YDk3q2+T1QVo7ny
 7sv3xYLIlv2kI4p4SF8hCDvsOkmw4o76vETkpUSUr5M5P3IZCV3VMXPl4KXKBdBAB0G0Jpk2HaT
 wYDXJlfwI/bIFpltEIba8wEsD3KlcocXIkBaFImUEw50NmCYRVCTqt97CqwIGYdSkwWeEeyJPeJ
 ELdXh8Ex+2aTIW0c7It08DW87MpYy/r2+jol9Mxzn3IHFZ1kuUYS+ORWf8O+PhApvnKGbnVXLX2
 Txk5WPeEOb3ZTbdQixw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEzMiBTYWx0ZWRfX0QWADAR8BRbP
 uft3t+k3qoJufRo7ZDhskMsomYq/nc1AzDu7o+LymrrmJDHowRBkd8ImeZI/xhjNMMKGMXkYuUY
 P//0chOajbfnLfkjFDgcuOHBElKitBc=
X-Proofpoint-GUID: P_-3kjdyjYa3jXBznXkVU9ydoqaYeJrw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_104047_549124_B38E515C 
X-CRM114-Status: UNSURE (   5.95  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

subject nit: s/uwifi:/wifi:/

