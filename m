Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709D2E85368
	for <ath11k@archiver.kernel.org>; Fri,  3 Apr 2026 19:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZPUYs+b0mIU/ZhiroF9fq7z487yqQRqJHomPd4ooAg=; b=hW830fAi+ux4OaxpzRdHXVZ/2k
	YsER3OZ7fJKzRpjRCqTMmNoSkZEagbce6xp/9Qz91jDNzE7DmLK14emfPzk3XR/dWWFeqqPSEJQ46
	r+GH6F1D9r0LdMYAjHon0Gk9PoNKhh2yNIPF7r1TC2/0yshp2XzeovRVwV8qu+HXHerf5KPyPPAWU
	fATJOXgfT3oJ4IT9cMSkOqzCUmU+SYT1mCDhEN/HoaD7ttewUW741ZlMOaPywln31+VIKclGOYd93
	D9lauQ0UEYqo6G7grl2UnnkmWKE2SWt/FSNCbyuDUlj7GMEfO2brtucQ2FP3IpqMldkZJPdLOJNPl
	nnZYeiKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kH7-00000002UJ9-0MZB;
	Fri, 03 Apr 2026 19:33:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kH2-00000002UI9-2I0A
	for ath11k@lists.infradead.org;
	Fri, 03 Apr 2026 19:33:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B1fEr1453615
	for <ath11k@lists.infradead.org>; Fri, 3 Apr 2026 19:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kZPUYs+b0mIU/ZhiroF9fq7z
	487yqQRqJHomPd4ooAg=; b=UGrO3P2r+r6lREb9nTHGY86LsAJi2v4vtUNIMr+P
	B83GBLnqnrEcPWhG8Xcjsxrs4u8qfhnziqy11jB7RZz+JnjhojA6HNaUriShUPi6
	pdpSnIF/NkXyzVRhNZ6YKCuFwT8fxy8JaUmUW3UUBjLvQdfdWY6OiS+wd1pmK/8H
	hhE98VOTkyPMSB2DZRdxQx5LX68pUOMOHAzL2YyOZmktBE7AGoog/hs2Ft+jsULi
	fGO2KxrAuhmJf4p45rvOA/Gm1zl6lHehaBfVK09D1mD3jDhexKB9erLJ2EpeMvN8
	iPFQxeB2Mdlmx1Dj7MwkxpFW63yzAaEgCq4q8dfoTZqQkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam9cyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 19:33:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093025ffecso38921081cf.0
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244823; x=1775849623; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZPUYs+b0mIU/ZhiroF9fq7z487yqQRqJHomPd4ooAg=;
        b=Shqw9rI0m3vO2haNPVut4nDOu1GqbnbCkPvYx1vnfF3Sx39OafLLNLQjyzfWikzw05
         ylncTR+Cv/7lGbDu9TQVLBWdg6aoMcpx9tADED7yZXc0x2mJywBGqG6Q7LSOLkyuRoJ9
         qv3qB+SRiYnknrt54RwgPcOPY+JCaSDIcr6nWCQxvXjhktfw/5VTOZpwCNs516Eb40JN
         ZPalyOp+CRSlHeneqAbyQsEeszmZj7uBINCg1OlrZ5UVEc/aNS9ztnUOY+y/ZfkBOOns
         7xMhpUhSePaoERymdWFgxYYcI0ryU+gUcY5OH7vGj22g1jcuZQmkp97Jg7v5eW584/vs
         gQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244823; x=1775849623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZPUYs+b0mIU/ZhiroF9fq7z487yqQRqJHomPd4ooAg=;
        b=OvTpPIBX0czT7ZEUHZU7t+9AA4YyVkr68EMDXkEpDrDPOm4RDl4NEyqHMlnxuC8M8y
         uThnhE5aSdmtHBossM37H4cNCCu1yKN26ieqOTldHnyEJPo0FGSYLK2pUOsEArTdrWKw
         Wgze/6ZjGB2/wsvC6xGwY/wrUg3VeXr9JRzTOwUeZGYbtLEgZAKQHftOEBk2J/xXTvJO
         pnrOqAbF1mFiA0DUc51n3G04xQD+uFx0lg8vPrmnHljOADLfWWkxZDkXxZNth31GeeeO
         btOxxIsV33clyJUvIzYW1nCQtqrYn/+c+nTVHbjh2qpnd7WrpZYzAwNAnHVTpIwk4fy9
         J85g==
X-Forwarded-Encrypted: i=1; AJvYcCUmMrLL4V4CfG+J9+AM1y8c/XPT49EbrYchBxqonNHA51I3iABGG6ABkzQC7Hxm6MZV0jdOzfw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9Du/SQO79EmJoRCOHlJ3fKhjqIR+HecKgnZdcLhukOesY8QiN
	iHQOqnKAvu6n39t62308dLHdAnQIRqiHHVp7hS0EUmGNPnUgVLuy4DA8kRETSGXK2CxWlAe6yJQ
	8wRT55yGj38fYY+meRodTKXDtYJmlyqx8v0PDXKHJ/8Vl+uBTtSbxaqgcS59zmSIv
X-Gm-Gg: ATEYQzxBTk2kX0F9M2bRxNUFIxvHYGG8fLiFVs/3qpdwNfPLKcv4rvWavF8ITiVZhLs
	WtATN3m8XQB8OgrfOT2SEJSfCAue0BX81kS9x+sa08bdNbq0mEmUmRtOEInPANBC//UpJjYCZUx
	CZB2LQm/GsimDHj3/WV3IVfxQa5C41QhlQ9wchDy1/BI9FyJ5lgelE0yCaJ5knuaDOtWNxzQQ7u
	IpPyE2wGcoYFY6mL8sxFXxA6jaCOPOcnXP0Z+OwFCFnbhFaFCBpi/MCU4J4rokqzH45umeoyvo0
	o0dMCTLdOt7DFfERLB5d4lYaledPGFBemq60nMpcSZyvDwVIv2UqzBZxVGONPnoKFMIaXYR1xsA
	6G5SQBwClvrXYIrZOTaTqGIJbJ/uys2ncNJzDg8HHk4gK5bEUqq4Pq6GJp19WN3pp+RayTi8IVU
	aKMrXIZ8ulFcskcC/ObUcYbwPKhd81ksn1Kjg=
X-Received: by 2002:ac8:7d94:0:b0:509:1766:2f4f with SMTP id d75a77b69052e-50d62b24652mr60694531cf.54.1775244822832;
        Fri, 03 Apr 2026 12:33:42 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:509:1766:2f4f with SMTP id d75a77b69052e-50d62b24652mr60694071cf.54.1775244822363;
        Fri, 03 Apr 2026 12:33:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd37b3sm1627417e87.78.2026.04.03.12.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:33:41 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:33:39 +0300
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
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
Message-ID: <cwhd2tcs3asdxqcjspq6sqefx4srixgkje37hf4fylc24glqey@nkxctkq32hwn>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
X-Proofpoint-GUID: 0qLACyeQIT5ON9Em62c-_j53ZKXD6m-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfXznJrNNQlNOK4
 I6Ss25ek1T0sxROax90NpVW9cfEozlfPSo5sQ6cHCRmalSQ1NzAMOJh4yWxTjWIUfyvN5cB2nEq
 unNIMHzhSHVTJOrV3xweY7sryM6JJ5PVzN2ZoWzo9/u77E7mEPcX9s2E4V5BjfhQYbLeuaPRm/u
 GkxpWAw6uGtgdMLHaUGji/v4Skt+hwaixduXm+VQ/Yz5ARQaBpzbTKNx2HbjeD/JupTPLmsvGKE
 nI+yH4oTLT5SQWzAcx4s0b4+5leMdmhcwm6JkVbabmcjfxWsRuRrxDjf7gy/aodgHH/kmsCVnkK
 ry1F7zJdKA44L2RekeiqJj8vMKioMC5SrFjyL6es/bKHW8ZdvxHT4KS4VSpIPxtfTEYA/TOPgYA
 /i/QndyZGAX5k/giDe15sfei9ldAtfJ0zNXna/cVmCmHlmayNwM6QElKrzH042cDCeHIaA0qYzi
 8AzR5DvqKuo7QmvPv2g==
X-Proofpoint-ORIG-GUID: 0qLACyeQIT5ON9Em62c-_j53ZKXD6m-F
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69d01617 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=NEyQqhXCQXLKNWlO9YcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_123344_709845_B0696481 
X-CRM114-Status: GOOD (  14.56  )
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

On Fri, Apr 03, 2026 at 03:52:52PM +0200, Luca Weiss wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> 'clocks' to the PMU node to make Bluetooth work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>  1 file changed, 174 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

