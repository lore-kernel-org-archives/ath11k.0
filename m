Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A3DCD4F24
	for <ath11k@archiver.kernel.org>; Tue, 12 May 2026 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3nb/GJON6V8wH50cv2OvL+b2XC/BfKRtqhaVBuS8x8=; b=uoiOXO8WDFtwmwgYMDe58ANiTk
	H2L3hfRw3obTdkCIPcRUm3S6qdgwlA2gU/3DHQhM2nSNDvmAeDGJHyVAzrbqjY6rI8F8yhhKnYXrq
	4QA44W0kwlyrxZ+lBTG3WtlOSN291DYC5APKJOut4k/N1407VeZhVt33/WDPO3yI2zWHUk4rzy6Xc
	RtUOW3cNuIpOwd3wofvIJ2qz4zEwFu8P6n0fDD0YBFUoRkx8WTECrXqjOg2tu6op+ZMRJDp0SR6Zv
	GhpuolR5WI/xv982SA49UPTVEGNPrAet0U15ycJdntSJ+S56z35nwgWfvydO6gqIY21pfskH5gHXt
	LnCnZRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnh5-0000000GwJ0-0cQu;
	Tue, 12 May 2026 14:02:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnh1-0000000GwHS-35VB
	for ath11k@lists.infradead.org;
	Tue, 12 May 2026 14:02:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAkX91739981
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 14:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V3nb/GJON6V8wH50cv2OvL+b2XC/BfKRtqhaVBuS8x8=; b=BhckIMOf0Z0HM8R/
	AZ76YrhNFv4mc9fNru3NttTQSVDvth7WQp4tNLbpbYUUwd9v5ZpW4h73PcFWFprn
	P9Va+JxINgM79Uya2dkmvmf6G+8Q3jTBJkYwidXVITtZH5TqB5H8GvQ0NaEXjLWi
	PTFI5VMcnyQ7/X0Qq9y14o+9yeeYwoYjQrvyOywqftsHxwjH5Ps3tRMDrWYCM869
	OLPydj3cRvwdME8sbYNHroXkoz6rbvUVEb3cvwpdUpvShvx02m0+hxCUVkFYQrjg
	en98SAAsqSAFLU/n4rkByKtuWK8D/fkVIHjREPp7I3xYmk2amAL6AR9De4MBfBrf
	8vHyhQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhrtcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 14:02:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f485961555so11318259eec.1
        for <ath11k@lists.infradead.org>; Tue, 12 May 2026 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778594556; x=1779199356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3nb/GJON6V8wH50cv2OvL+b2XC/BfKRtqhaVBuS8x8=;
        b=ZwyF8FyY1KGXESwT8rexWezLI1stZ8uF8GCCcYQVVT9zmTSkx7rBC7rrmuVatV01dk
         3domK7XGbHJIerF/kF8jEfyI5EW8JA6SGaqraFcyiGDvg9HUxdGeoEZnQVQIVEp2LZs9
         HblCjBF5mJifsF5YFdo3Un8p/OhoU4cbg8fZQMvZ26zcvR0v2oVv0WJf7ydLtn7q+hD/
         fvHm4ItYLlvLdMP/w7URC2Tqn6zphK41Y636jufdoLCWMqS5eZlko8SNCgzjn7LHpajw
         ifMZxCg2t0nn2TT4JSOwiZe9oIVwYtYOQ8DfNfMcHyNocYysn2Ju2Insxz5+t2KAlngU
         X7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778594556; x=1779199356;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V3nb/GJON6V8wH50cv2OvL+b2XC/BfKRtqhaVBuS8x8=;
        b=GeJ1uDQOmicoS9HG11HOn5FkUL1Q+TXPIrs3RTzoU/zn511zk6ImrtiJRqlnTOcc4x
         mmOx6Y9Aq081kBI5pZhbZUDM1zXftkTP+oHSufhh4Opq2/qXZ9UBPB9TDoFUNY0K8HEp
         HFuUviLHbDe17Ah1hZTvOnhMx5bNHlwDG72QLN/lm+kuRpMmUpyWY7z9IOWwrH3up3ht
         oOSgZdV9i4oOe5uZ2DifJ2q10I3xcwW3f+n2KHvsuzzj0bTkEIY/jRmFV8N9iDjiafzc
         YOmgYOmaKYcwwW5rdxN5ykLa0jwKxWz6wWXb5W+F22MVcTdevFp4pr+Yjaa8VQxR+ShO
         PNhw==
X-Gm-Message-State: AOJu0YwAOQbcp3KyV9C+Hk9LFFt5oFyTOFFuf6K7FX26I3x8gFZT+Hm0
	Ltj3+SIQ2r5m0PVlCRELcH4yg7PZJHUf6hamg0xrMjUvicPxkQ1b+Hn0Ng9MQpLxL93ohKvemGv
	CCOiQvGRtyCddWE2an90c5cenrURTamvxnR1KrUYmoDMluJ8a7QaFb/uBWfmjezn2
X-Gm-Gg: Acq92OFe0mYodgzklOB9LflHJuEXtom3auxbuFKHbLe2Qm/Y6KfRe4Wb5tfonDzV9g+
	xBIFFoHLJpbARcDo+sIRWgVsH5tb6Gc6etva/h3tjrD7Mba5TBkdd+5yQpyxe8GUH4+LP4JNFyA
	ropvtarqYikNBxnybm1xjWxrN3b1iEBT6DirI8DAlb5Ya1/80LIG8+iXgS9TYd+dtZFL3twnCvc
	Vzy0k2E7EY4eqnFWgOllo2/YDHv/iNZa3HxuAOLOHU0CY5d5ITdqTksMjtbFmaOsqruG2/TSk7f
	m87Dp55VwYfopfuSmlOfVmXesJyPKx4cUn+1d3jRN6yMRRDg3MGaCuT5CioPbkREaDdPAnvz0I5
	p8ZldruJF2Oj8ZycUSXsexKVEl0muKllpOy67lxRXmGoL
X-Received: by 2002:a05:7300:478f:b0:2f2:6dde:df53 with SMTP id 5a478bee46e88-2fb4b733e84mr8180639eec.17.1778594555095;
        Tue, 12 May 2026 07:02:35 -0700 (PDT)
X-Received: by 2002:a05:7300:478f:b0:2f2:6dde:df53 with SMTP id 5a478bee46e88-2fb4b733e84mr8180341eec.17.1778594552791;
        Tue, 12 May 2026 07:02:32 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm17657298eec.13.2026.05.12.07.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:02:31 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260506134240.2284016-1-nico.escande@gmail.com>
References: <20260506134240.2284016-1-nico.escande@gmail.com>
Subject: Re: [PATCH v2 0/3] fix leaks in some WMI error path
Message-Id: <177859455169.3185911.14184991493607039564.b4-ty@oss.qualcomm.com>
Date: Tue, 12 May 2026 07:02:31 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE0NyBTYWx0ZWRfX7wxR7sYheCvc
 ujadMwxPzfhWwiALeAZ4O35jbaVU4o2ZyM04IC8+jKNpwcVSkWEjvGLQ8KYMNh8+cE4EJMO8twW
 9QYiiEuHFlohFnuJHoqHCRk1Ai3boYPJY6mWZK3BtKFvXTo6bKZrq0fD2Q5uQQ2wKm7Z+h8YQuW
 SrxFoB59ToLQL+NA4H0YeDyRG/ObocJ4I1KmEjQWKI1YevGoJZFoEQm17tR0F8YeJfiMhJwuq2Y
 /jEnQBRr2aVZE3mZij6xjsfPwvIx2P648c5wgjDex2uSBkEApL6Fox/v2XveEcdThLTAq4IxN2X
 rDNCT42cfCtFngs00sDMQcFeoagkz+HDZJO6e4BMG/p9vcBI71Try16CSrKQ6YjGcdo//jmvQvP
 QZ5xAqBr+rM4UiPjwtt88bp/UNGLWA==
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a0332fc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FqyUr2HIOI8AG8dd71AA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: jUeoFGP8AuLFECvU_f2GHLbLxyKMjsZo
X-Proofpoint-ORIG-GUID: jUeoFGP8AuLFECvU_f2GHLbLxyKMjsZo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605050000 definitions=main-2605120147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_070239_891789_79F05DD0 
X-CRM114-Status: GOOD (  12.29  )
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


On Wed, 06 May 2026 15:42:37 +0200, Nicolas Escande wrote:
> So this is similar work to what has been posted here [0] for ath12k.
> 
> When we use the pattern 'return ath11k_wmi_cmd_send(...)' without
> explicitly checking the return value we fail to free the allocated skb.
> 
> This has been split into 2 patches per Jeff's guidance to hopefully
> ease the backporting process.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath11k: fix error path leaks in some WMI WOW calls
      commit: 55dda532bbc261aef495e403c8900c5e2ab5fa34
[2/3] wifi: ath11k: fix error path leaks in some WMI calls
      commit: ebad0b48996fd4919c36bbcb07289d37d046de74
[3/3] wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()
      commit: 7320d6eb861e9913193a7801834c661381756a79

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


