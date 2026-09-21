Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578D8C982ED
	for <ath11k@archiver.kernel.org>; Mon, 21 Sep 2026 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tgy2DCt+P9noevQTi8uj/7PrjpZlOMzQlxRytsgGt60=; b=sltn7LEfOXjWzOeU3H6MNK6Eb/
	36Ynjkakh9IVgnzlu4rpLEc6QR/vZqkVyEGkkuQSxANOoMvDeCfQ5e6w4gaGki0wykBq+txn3s1UP
	WzIiYv1JJDeSev3/mI8Ctf27lt3rgdy3lhEBN+VEttziHSBnsE9L5xyAVueWEcBOXZtfn+uVrmWBQ
	fwKsV971nICRRjv2i+mvmJtQRCbRBybxhCU2u2atgiCApTVtwGi2LbV+aiok7sFfCDjhIDOxXycHO
	Qi4Fl3bVVmr4K2CPuRSCrpFcWY8ywJkiRvGH0DYyXmTqa2T8mDdeYtQL1AES+wUx7cLbdCRIK6jP4
	duxMn1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iJI-000000034Mi-3gDE;
	Mon, 21 Sep 2026 18:00:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iJG-000000034Ly-2Ei3
	for ath11k@lists.infradead.org;
	Mon, 21 Sep 2026 18:00:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA4iX827676
	for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 18:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tgy2DCt+P9noevQTi8uj/7PrjpZlOMzQlxRytsgGt60=; b=hJgjoD1zCiuSMrH8
	FbLfbIiUCJrLhQDcOGhmeT8D9iurvNU+XCEIZJjHxxXL2VreCWMVRA3SLq312xEQ
	DD9Z/uEFYFIfdAQLxbdUH2Zx5ZPK+xF5p5lD7J+9j3Ccjz+uKN1M2aT+Ayf5VF/p
	k57dOUn1Jp4R7UdiZJ4InM0J8C/LbKffsnr9ysL8DsuBsja1ZR1P+EHr19kP4LTv
	uQUQgfRr+eeXyWRePXAObZCPzpUq1nBBXjM2WLYmdyJaN1whkG4cFXVgIyHPMjPi
	mlUWnunu+sDpn3MZoz49vYo1KolVmevk1SlfR6Q8IJFYEPORQI0tQdcrt0Iew83u
	t8/WSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gtbsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 18:00:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d959904658so58522175ad.2
        for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 11:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790013609; x=1790618409; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tgy2DCt+P9noevQTi8uj/7PrjpZlOMzQlxRytsgGt60=;
        b=EvUj1q92C/tc21cQTWi/HB93ZM0tFDy4OjZRR5bNKytudG/d4T4Z82Hja1nzOTY4k3
         +DCixjUgvkrSCm+EHGNk2vvsaUFCrOxPK1+20wlrWWBbv3QcG35zErEoyvTX28bVrIFM
         e3wFBwLR2b1MVWPAxTrTNh/eqTRiG0TpAc4eV5msptnff64mXDzAaBrKBUAi6G1ilGP5
         /XqpNsCn0lZG+hKGWOzK+Yf0pRFP12GCHzFD6x0VuS2NWirJZ8yr4STxxyjAKvNFl8zY
         JbZNPg3X18HmDv0O1NNShduQJF0nojQaL6acrHPEig5cLINkwspKw1eJ5HhubWDOLd0W
         2New==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790013609; x=1790618409;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tgy2DCt+P9noevQTi8uj/7PrjpZlOMzQlxRytsgGt60=;
        b=2HL6uXwP4Fr4uugtB3eMZ/tqcIRi3MEDkEKim8xvkLfVgw+Nkt5N5B0Mgv/IIjcwlO
         eag5rgV6lqVIIeIR9vtpeVCBvynF5Cjrm9nHpzLlc0TQr13Cet9pZqeKI8DMxeffYEdX
         /tGtkhgo0qoRevZgCQW0fppBpnsWtV/QnnlArxNPijIfkJROgr1OUqZ9ZAUURmcNr8r0
         C2fdUCzp+2NHDo2E4J3cgk0VPw7lrQssUz8icXwIQo0SwXBVVJayEQR8e8DCTkD/d4kJ
         Zya0irGuXnkDLr4PDVt65P5tfLPlhICUihfNdaeMqEjMDxgG1XS1XMdy3grx+tCiiaDj
         FrSg==
X-Gm-Message-State: AFuF++k8n1BVyNA1LZOp29km8y5GLDwjK+UNjC0JToiUJ+xZGXjcvXUc
	am3JiP6kycLLqERhAPu4/ITDDKKmMktGqKx3waaVqWXnch1WiLsMXsKNC+6aIaiR4pF/QxlxegP
	sfg2Hj3Z8V6y5y+YOuo4T7PqClMuvwVnSfcK6LY47S3JWFlNl4hdF/USSuSZSGUzR
X-Gm-Gg: AYBFou0mn3gTljVFbLCExcUqh1JiMQ4R9tKeyiWCwDkLvGUwJmmqxITM8UipQmCbb3Z
	kkcD+a/OEyThCwGJfXh78yfRPzBdyoKUOdn2kaqu6CasYaQcYzAak3leW/DoF/8Bh7nYSgZjasH
	SKyDK+J32OPgwoZgvuwVPij0hXbKm+7sAKcF48Rm0/Dsu9ncChHaFnIvZqU5BklcBZXSgog+l6h
	FglPX6hQ2SA8WloruW7exoe2X4pQYwXVy7O7vgTkKX9+AV852IeB4p+RRS38tzWKt+C4yLk59Md
	xXGcV16jd1zVqsgi3Y1wsgQaq841/SyTM22z5W/ZH37L1MDlQJrS8KMG6HUhedUPT7JhG3o018J
	B3dUlR/zWWQHl05j07Ld0AF69LzCHoCSHWEHcFDU0u+eVrir3x98A8Q==
X-Received: by 2002:a17:903:3d06:b0:2dd:ad73:5b72 with SMTP id d9443c01a7336-2ddb1d5ed8cmr163764245ad.34.1790013608812;
        Mon, 21 Sep 2026 11:00:08 -0700 (PDT)
X-Received: by 2002:a17:903:3d06:b0:2dd:ad73:5b72 with SMTP id d9443c01a7336-2ddb1d5ed8cmr163763925ad.34.1790013608200;
        Mon, 21 Sep 2026 11:00:08 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm22873198eec.8.2026.09.21.11.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:00:07 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260812-num-station-v3-1-871d20e043f6@gmail.com>
References: <20260812-num-station-v3-1-871d20e043f6@gmail.com>
Subject: Re: [PATCH ath-current v3] wifi: ath11k: reset ar->num_stations on
 hardware start
Message-Id: <179001360744.250336.11058202665235470061.b4-ty@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:00:07 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: b-OiDxULOHOBIeyleDbCrFatH3hbZVsx
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab170a9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=POslfGUCWg19xbYTY0EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI2MyBTYWx0ZWRfX5OLPqhylJccB
 OqulvUff6nWXvzC/0aP+OYe7P4/FHqUJBMScSlUhg4mV1Kd8SeRSlGVNXwHTAmcP/+F2UTyQYex
 VKDHNSQUK+uxqike9/awCA2+k4x9mwwGozL1jIIv3Md/1sB/gEX1tMNxZE74rwZP0uWh/wCixmD
 m6wRqZBktjkS5ZT4vGqZ47yiLDML3r2GRNP6P2gVbHfI1XlDwM4Xmkxgrqe76EumpjrMYuHawXe
 loszMgdZLhfqmlNNvvA02z/2m5PLYqwcGhLbIfw00JuhDf0t+yYLwNPSObYzMuMMYDag8VYBBIe
 fkmIl1jb5yN73UMdokEXoVUNQrJByDfKb1sR0dBxHM/KpOi2el+72OmlpG3Y6PpYSQdeeTDiyuZ
 5Cq9QGO1cQRD3RXCk5b7WCPSofFM/vXqK2xo3f9fNH0S11+Dp9CDb+/bX+PZLNlwjnxQf4OUC86
 WgZun6UEXys30+wHqFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI2MyBTYWx0ZWRfX+rAo5TtCQjX0
 gDR8LLGuNh+13+Y1hy9367xJxLdd98fPJjdnUldkQWg3bDMuJVESKt0AvVTmHE2o2UkCUPUxevX
 ibr32blx0hsds48B2I8Rxho5ChwFlc8=
X-Proofpoint-ORIG-GUID: b-OiDxULOHOBIeyleDbCrFatH3hbZVsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_110010_577582_6C9610BA 
X-CRM114-Status: UNSURE (   9.49  )
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


On Wed, 12 Aug 2026 16:58:05 +0200, Nicolas Escande wrote:
> When (multiple) hw restart occurs, we end up in a situation where we
> cannot accept new stations / mesh peers. This seems to be the
> 'num_stations' in 'struct ath11k' that did not get reset properly in
> this case. In ath11k_mac_op_start(), it was indeed the only accounting var
> that did not get reset so let's clear it too.
> 
> This avoids problems like those:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: reset ar->num_stations on hardware start
      commit: 7e0ad05ebc72fffba2bdf2400400902d94ed7272

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


