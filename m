Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778A6E85368
	for <ath11k@archiver.kernel.org>; Fri,  3 Apr 2026 19:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYnQcnhGrNgV/eoN2v/2MbLYnIbeQOs3Yrb0qovNiyA=; b=qUWObxqZ6RoLtcq1spftxowXNB
	BusNYMxWhUeTxBPs8RHIiQIeeSFjKhI99uVCkf2otdKXrFPlqeGOqpqlSxfhAnjR9rvdew0K45OfI
	jgfIs1+jgO/qyw/BDovckHLxDIIv3Yl9VEdr6+/+Fry2EfUJ36Lg620/KfbxqVaI1iAl3LddVvEMH
	2B6lkdJis5izmth2A3cRn4Qx3VM+LaFM50ii/3HVDS2h6BP/ewN/SYzjlHAj4qw+r71P7v+be9Vnp
	s9IR+kMJ1xSZRQlWzv6z0DGmwSG+w2zKCGuYFGmKw7bMfWiiYWDQ6z743hkJgJX/4Z8VQJs5IEVFK
	Lxrufqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kGZ-00000002UDK-3GP7;
	Fri, 03 Apr 2026 19:33:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kGW-00000002UCi-3Km0
	for ath11k@lists.infradead.org;
	Fri, 03 Apr 2026 19:33:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EUbPu948009
	for <ath11k@lists.infradead.org>; Fri, 3 Apr 2026 19:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hYnQcnhGrNgV/eoN2v/2MbLY
	nIbeQOs3Yrb0qovNiyA=; b=SFXHOl18ZrNpJYsxzN0alNvOumMDCNM30qEr/82I
	PJbpGr61yKTxM0Ht+vfdgHQSS2ODMl4CQky3KuOEgsguhcW4Km2MHi+7ZfeGHCxa
	dKpua3ge4HBlz85i+tZGv5RfTHQCsPTxgSSKm44+pn6FdFyCpQFnzY6W9Yoh09Y/
	hmTWqqhtVosQ5po5LI6q3xPp6p0KpdqSpv/yDNICpnVXYIcp06rC3wC+WWfLdJ15
	pGeyH3O6nbSRHIkySc+L6Negk+qMi3rhyOfxdHK0fuQYpOyKWnWH5X+WiI+zicaS
	JZretIRWjpOFR4hzxFjHhRC9fxX3nR5kh0M/bU5r6MpYeQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfkqrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 19:33:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5aa81907so44940021cf.0
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 12:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244791; x=1775849591; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYnQcnhGrNgV/eoN2v/2MbLYnIbeQOs3Yrb0qovNiyA=;
        b=YA4uwGSCnlxsYx85YhGpi5IAv5CGF05X0nkHjQRxg0+hVVO9EIg8sj6xZWtHRR7SK6
         MYpBw3Yd0uw/gyTlTBJzX3RQIxZEwxEH9uyY4qLKYvF/acjyz5ECc5IFreRyaIM7+uSQ
         Wo5VWhKsdOcKeaR9FOtTdvS5D0+mYyxkKTvzn+ixsOb2mSZCbvj/5469nEmrR0UyNMTE
         bI8ViDOMqlUT2GnYi+fPgm+XF0oVM0tkC2Ntj5DhO6IaJQRMCx2wvJ5F4d78OJvXIM6+
         DdTtS5KkW6+3EuKluyjGERZ+VtQ9SaOcr2DVqrbJqoFHHrcpIco/67Vs0YzCYaiRWGX4
         oV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244791; x=1775849591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYnQcnhGrNgV/eoN2v/2MbLYnIbeQOs3Yrb0qovNiyA=;
        b=bji2a/KxtOieH6Xokz2ihQCCdSB5WN1OYZcZd6SeR7cEfJAoOQpT6l/Qv2CHUDp2PU
         S6LsDgaojD8FQYte9UWwNi0O8pC6Dr9H+4D7JRI39ylmdhqcZJ1P2LVLD/PYxhOU9Ptw
         K63Qt7de/gai6G6FK3Rm7NikHqWileZ+QEibBy5S0jVmro/9XPKyxsD8MV7eZxizjT7z
         8b2a2N8O480NFdF2bUzKTsDOfsJZcyj8rwMB9MFAbVjBKZoKoHJW2K5B0kRRB9kpm2yk
         rvXPxVUF9kh2XGyoqL6Td4eUlMlL8KTPd0sltoiGojGkipm2zTtoqu+R2nvkvYq7u51c
         Sw7w==
X-Forwarded-Encrypted: i=1; AJvYcCUYZBsz2pnoK7IQJjHbaouOXc8oGHzeDrAagBXteZFCeXLKKl81goRWY44uXAc+8/aKbNHB4g8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiG/PY29y8xX1RAp7irLJZ1jHtzw/RyH3uftOc/twyjCVpLi/7
	oiEq6b50UMJ/15f5QXgSK1TLhohqG6mSeKGqdLtaeaOWJBon1+7bvqNZUSNVM1fgpQiegY9E+ti
	G26fW9qRL+I8XmCsnZ12+Eg09hd3IRSjl4dAHge8URYj0pyzi30LlqruwiAeSmimj
X-Gm-Gg: ATEYQzxZ3iJrUjxLsUDJUESuS8ztC2r8c7O/uTTVMDZFv+NgH8d8tvxTLfn+v2FfaQL
	mwSB+J4vLWzLJvrjBm1+HyGApHwPPZ97wdCBA+uCrKa99BWd6SFK5z/wmyXJoYxOFqj16a+Cq+1
	qTBnWU5xaaIm0CXkiMismpvtZIDWn7rOv3s5Nl5wb+sVRbvVpBZwyYudAdER6dDAqD7fnMAlyj3
	ykQkG9z4/77VRc5R8O53GBbp0QKWXIp6IX38WS+Q6mRYg7xGEyV5gFhA92bo/cTV3k8WNSPBCuw
	Fs6Hpvbr9D9Cys/FsHrEdycqdDB3gTUmPiAyfsW593B0z6Fp8ZL+xtWmjEGefqJQdTSFrQJ4jbK
	rTa/veH/fnVoWIet80ALgg4LQTgOJCwVL8ovFtsz2DmRuUXe9iz/p6EZb0/GVT+4t4waQUHZ5CQ
	rbTZuCBCmQV/WgN44aUf/auFPvubpAkeqdHbs=
X-Received: by 2002:a05:622a:6850:10b0:509:481:5365 with SMTP id d75a77b69052e-50d62b02630mr48690861cf.50.1775244791129;
        Fri, 03 Apr 2026 12:33:11 -0700 (PDT)
X-Received: by 2002:a05:622a:6850:10b0:509:481:5365 with SMTP id d75a77b69052e-50d62b02630mr48690431cf.50.1775244790654;
        Fri, 03 Apr 2026 12:33:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cbcesm1654085e87.21.2026.04.03.12.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:33:09 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:33:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: milos: Add WCN6755 WiFi node
Message-ID: <7edl5o4lc2jk5exozyxomxjzooqqhek5zyvmp6e3p4ndxweulg@h2dwmk2zizgj>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
X-Proofpoint-GUID: 16JCSrr82lin7wWyJ0MVqyqCW3usqkFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfX2REE7nORfzLM
 IpBYFgKsiGbAoCCrpsltbsw96f2k5kIHRfvCFhbJ7ZuYdcCObJkQwp5sD5Xr/MoYbwzpEDj5aYm
 qPJzwqMhYDr6A4oo3tIE5CCqalMPDdjgxe0kfkQUbsoEbqgij33Bea4rW1+DDVOvDKm0cCiUd9k
 p+phX91TRc8LGvuAeFvN5hEQzE4ftLpNvHFfLVvjzquEDzBRkNwxCiiARRL9EacN5auGD82b5/w
 kTKh8ZIBKopZVdVtp0ndXgF9/gvaxaYW0zeQFuLpy/BHmdmxCb5Wsm59W+b2qtEd4TImN2Ny1Lt
 47YOiAB0/We6G1i0sRQkIPhv3FdBZzlZ2l4J1O5qJ5RgBdA9Km2JCdFTwI1DVuldfVfhtR+ddjQ
 xigeTG1PtC/srqSNkhlYaJ0mnDphsZM+crdAifIgv0paulA/lbV9jNbdLzDZuYUduy/+NRPuJkg
 Ac0k8vsy/8AGWEr3EBg==
X-Proofpoint-ORIG-GUID: 16JCSrr82lin7wWyJ0MVqyqCW3usqkFk
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69d015f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=nnh3LCdgXL55amKsc48A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_123312_848162_25C59D2C 
X-CRM114-Status: GOOD (  13.10  )
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

On Fri, Apr 03, 2026 at 03:52:51PM +0200, Luca Weiss wrote:
> Add a node for the WCN6755 WiFi found with the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

