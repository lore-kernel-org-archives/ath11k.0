Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85D4C44536
	for <ath11k@archiver.kernel.org>; Thu, 23 Jul 2026 01:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNH7Voj4BrMj4vL4hKl3TEX7nxgdpyHnc9326Sz5g2Q=; b=h1yk/9bMNdnQTuQ8gm1kU4pX2K
	uJRFEkvuAnGGB4hxoMTbMyvVwc96/s/98GxHtdJDAGFDc3B0JMLRfXZvNMjc68vq6/zn1Z6FJ8tGB
	j5enhWyS6g7iMguGuabCBWhSNJ7gcAM1tGzaa6PwbcsR1yMbS5gc5vC1BIxEVNrLjMIZXpcc+lZxe
	wao9Mpu91LhSphYoizGD+8FFVNe7yb4Bb79MwGYhCi5FG+3uz7yQtsjEghKOOQlbJQjFVdHbdaPNM
	8cDlVt9cEFkquEw56N7TqqJ/pK0ZbtKvHT5MmTMtaKkO7ildKIFJ3auek3hyvFLMYtksNk/YADQH/
	WJr5sz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiDT-0000000D2Qw-3HOj;
	Thu, 23 Jul 2026 01:27:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiDQ-0000000D2Qb-3AZi
	for ath11k@lists.infradead.org;
	Thu, 23 Jul 2026 01:27:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0Wl0M2519479
	for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 01:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kNH7Voj4BrMj4vL4hKl3TEX7nxgdpyHnc9326Sz5g2Q=; b=f8VCzNbsyFyVwbUT
	axprXy31irDE6miHTWLDvY8slz8skAzzZmXFwXjL5TK2s/aAoIdZ7pJmqjf4rQqI
	UEIbJyuZmf0miU2fYVabpGCHTcUtA8vg6kzQMUssIMMa0DkHYA7SvdODXHINog3a
	C30IMC96+k7xGEXrN+yJJmG5P+/4+XutGW/IfHcmQ4YO1dvzOblBq6Lcgv2QI8CP
	jnUV5AhMTeiBU7+YQEofUdLdGw94a5uiVtVugidPl9YFU3W8ofbHg1/lGpB7cMmK
	ZbUd5HIvlcw6g2r1ABjkbAzH3T28uVFslwe9178G0NxBXilwR5qZUHJvchWSSVK/
	sjnOCg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7gg9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 01:27:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso249062a12.1
        for <ath11k@lists.infradead.org>; Wed, 22 Jul 2026 18:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784770031; x=1785374831; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNH7Voj4BrMj4vL4hKl3TEX7nxgdpyHnc9326Sz5g2Q=;
        b=kaUXVRaD66iA5pi3koU3aY/gAWClB2W/D/PImg9YK3Wkmsx0jQk3bKhR3zAQsvrmxL
         NlRdHtTnKF4SSahBKv9j8z+DdlOI1wLvOfTHbaaJoY2xlEUhMpIJNz69apDEwOEN0X/Y
         HAJjwN6XSzQT6K7j6mX0Lopa1JOA+NhXknsBljL9VD4X0eeut6D/NYzF7WTULCXIfqER
         Us60Ipxjq9QtGeUrGfyNrLYwu9pb0iMCgWv9fmNnH+1hFxue+oKA1CUjzMpC/UKGDskc
         kfE2sNdIZ6+9uscQI8/Y1k5d9DjJ8hpJN8k9+/UkfHNAm2CbDqsnAH75Sm7fZHpsneC6
         gPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784770031; x=1785374831;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNH7Voj4BrMj4vL4hKl3TEX7nxgdpyHnc9326Sz5g2Q=;
        b=Z6+fMQMD5AWWSIv7Y1XnI/oKotu/+dOatLfJuHXHakxKceEXTMhE0YEAVAVMTkUG/S
         sQNk1Bxnjmovdkyf+QbZktnxrZyAyzX/ahpdg096HfeiCqMferSDxIL60Y+bfLWvD3sm
         91W1UQDrjXRrTNJYd2f7hk/Z8DqMgXnOIv5+mLt/j08YP4F/26C7awOnOCox9aUGleqh
         WzZs7c4irA8UXqWxVowM4hV0T/4wnEqXSolSVDO+X4wEzWs1cxm8JrEZJJCScmnRfSFV
         KphxLrCIdNSPJUzsBOV1KCFNHPqk7OIuFN3y62fV/q/InRmi/45kW0X+7ZJ6RP5ZLeP8
         PnLg==
X-Forwarded-Encrypted: i=1; AHgh+RrjFUMj5/W3oxSR60Cly2qJCz9DqhG2GL+E7xH7UsS67tA+E2v6hw9d5VpdG83msKUP84qIZZg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9a6uvftP7sdi+c1uIqUxQsC/jD/dBai47lkkKifnIdNh9GeDs
	F32BwW7mU8l3d4vjm85LTpnK2h6gKWIcsNGpCiAV/XuJbWgtfDDYO0MhWmSq/cRKz4AWvT5FKof
	5Fj0Z6En7xyEnY8OsL1OK29xplouzlndWbnTRQAF28TzFx5bQMuH0p+W3a9cA2MT9tC5olGAN
X-Gm-Gg: AR+sD12ZTaUEDFIE/rxZ7Ec4dVTy/IFOdsjNwN1KjQL0QFVFSqmf60Ab1257cug3zkG
	5+9ifxdhKeBXg2K31ITCnzv6pE9xSxGXg/v4ojZHe+H4MYRK08xaJmPQA3rANsx3fTF95Myc/R4
	YRgA3UGqSCWBDQpiUuivXIcBBupz3h6tz/FHKBjOLQT09mIxLWI8KbX1JPNsCBR6ZbxFlVf5hMa
	eCxe1Zom8wXhr8rGD52HgUY13K/ZF0NPZUNygEc2JvueXKm7i8/jSmCvCim1x8vTNq4vEwT9i3P
	YC8XdYlu710ALfjlTwlEXxIRFw03HQf1ygytYW9BV90CuOUv8JvrrT19gmYwwJd3UeytHGBQPoC
	ibhALYVQt9dGvop5REzKbpJ6Y3PV4KCvG0fkZYoqaiv4nS/4zcqh13TryDQ==
X-Received: by 2002:a05:6a20:4387:b0:3bf:6c05:ab with SMTP id adf61e73a8af0-3c44b21f1e1mr1034484637.58.1784770031400;
        Wed, 22 Jul 2026 18:27:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:4387:b0:3bf:6c05:ab with SMTP id adf61e73a8af0-3c44b21f1e1mr1034457637.58.1784770030951;
        Wed, 22 Jul 2026 18:27:10 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d12f267fdsm10579220c88.0.2026.07.22.18.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 18:27:10 -0700 (PDT)
Message-ID: <c8634216-e35a-4d01-8f76-d6951e4689b5@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:27:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260722095419.1411003-1-zhaojinming@uniontech.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260722095419.1411003-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1Z09QfeY2rsMNYeq1rtXwg5f6bK7e0oc
X-Proofpoint-ORIG-GUID: 1Z09QfeY2rsMNYeq1rtXwg5f6bK7e0oc
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a616df0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=nIXYEoMg1qDLEO0gg3wA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAxMSBTYWx0ZWRfX8zIIC9XNkzUU
 9Q5m/FKkeakZo+i3d1qcqoKCeigDcq8li+6aVGubjZcfkMtuxSzj6jROEsxG43BugPE3BfnfZGs
 42ahYsUiL8sydBL6dX1vJUjFoHqlusM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAxMSBTYWx0ZWRfXyoaZZheyVno4
 7UfOp2SIR6HLf7f+Ucd0NafG3rLJ5p5KzH5sMsj1ny3mMHRx+Ig1Xusw0kLv4X+5yG81HZQ+DpX
 9BTxdcPPtclLPR20JPJCFQ+Gzzb/ylaCvrY+vDkPZtKL3IulNCoMHUksWMeciO6X2WLy+Um21CE
 EngDHB4VeewbUC5+arjTtyNujoPQH+BGjD5MeyAMFn/46v4sEVSQKtiWF1cjeRoE+aR4P1DKSXe
 JRN0pvkSay/W/3tuCtPiONdA/oNt+yo9P1YIZAsmz92YteGZKC1MfGbRaO+156s96YsszZfpV5T
 c9HAqIfsZZlZBSMVuM4WjP/lEtTa/VQ8GKFPKPfnMUgyKk2oEk4mMMGlMv0JhOUWNdHj5kYCHyz
 ZGpbFwad8Vek+ozCx/aLP8yjliny1imyZB+dYh+t5y0MXnV6sLn4/K/S2DTpJGPWzifkGEHA8/d
 MprHqsjeo5T3w8GC2oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_182712_839600_E55A1CDB 
X-CRM114-Status: UNSURE (   7.27  )
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

And now there are two patches with the exact same subject.

If you repost, you should either add a REPOST tag or you should bump the
version number.

/jeff

