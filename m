Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D25CFA471
	for <ath11k@archiver.kernel.org>; Fri, 21 Nov 2025 05:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MnA4CKR/bhunOHOYeKoUfMbGWiO2RNra8goyL03dK/c=; b=MbFs+fVZ+nEhiwIqAAdKzWFDf8
	etAuyQq0Cu9DAlpCNAQyXfIqGDQbRWGDi1mwSiYNGITrdUnc0EhrUuPRYVCLEJy0V7GeXjPwREpE1
	CQIx/g18cPV6QAkRVA6RrLQLYqV4CmrshzRi/MN96GMeGfpmhzNB70bz0QEqBxnP28DinHq1spqf4
	onRALj03aJdnx7Moy1kqEarjUJEAUb1uxk85cyoxXOyPgJRMC3bJqzz9Xl6oiKZlMtgRhlQo3G2wA
	/jXx84VmZlUJoSmqnOXvrEExID/39YSjJoKYj8qAIKcoLRMGO2ikD5p3mBO/8cCPnnM1vH1/i4Hsi
	0wCNd2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJGa-00000007p6L-0Cgy;
	Fri, 21 Nov 2025 05:01:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJGX-00000007p5a-0K71
	for ath11k@lists.infradead.org;
	Fri, 21 Nov 2025 05:01:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKKAkjJ1829100
	for <ath11k@lists.infradead.org>; Fri, 21 Nov 2025 05:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MnA4CKR/bhunOHOYeKoUfM
	bGWiO2RNra8goyL03dK/c=; b=FoF1WAV3E/6RxlsfgX8eb24HNz2vbJyRFziip0
	w0pe6lj3FE+uceuWTkfpZf8EVVxIq5M4YCmeTYRj+XbipXHvDbdb/LufSsadHWw+
	VyD7VLxixwVbw6R/Qs9ek6cl01q1NXO+S2028JJezNlvVzSlSh+Rkp1mY2U/GK6m
	ruCvVvP+eiekxEo/0mb/uaROPeLsnYxPIW1l6Y8ZOIcIsxZ5RGDMrwEsu0Q7UfQ+
	RwAYc52dAX+xYmySwOoezAqEXj3k8HixTQ69jPfE136lnhEDXAXf126aYS+ae82/
	GW6PbOqIAx7b/qM2SASRkXI7rGTEUXso/VTwgCItBtDOqsLQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj0kw36e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 21 Nov 2025 05:00:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956a694b47so28788795ad.1
        for <ath11k@lists.infradead.org>; Thu, 20 Nov 2025 21:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763701258; x=1764306058; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnA4CKR/bhunOHOYeKoUfMbGWiO2RNra8goyL03dK/c=;
        b=MOX7qAiXf27rXCynMdJoUN7hJj0w16BsATHPCL9Q1qzKSCgYvqce/EHYKhIfp9qgR3
         H5fR3NjH5weO4tVY0JUl3FzhQ0KDdqUazl2gbLgEGEAH7enk+MhCadK/1x+0nX6Q22RI
         cN07/7Gj5i/XdB7d+DpqKrofuqagxtXB/kUF7W1xXgLJD48LXorDV+Wy4/OAJeA1n5ee
         nAos/JANvHVuiZhFXzHAkq3jQaQ1hFVbq2ZVYB9Sh+URRigO0AN1q8ujOUU4OlrflN2n
         mUMRLte2F20GS/NAlgFo6S6bGwjUD2gss8oxOXsUFf5GLDkaU5wqVMzsPWhQfgJszZYi
         r/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763701258; x=1764306058;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MnA4CKR/bhunOHOYeKoUfMbGWiO2RNra8goyL03dK/c=;
        b=oH2oLAIGgvXIM/0JNva2qmIuNx5xLN6KRpU5uDHZNVXHeE0RJhGYankXqaxQXadDAp
         fkp/t0anQrYAYVwWTDQdzNPZ9g4nV8Qo+YukQLKuJT/zIUzMjU7cfVeE4yP/DsPwHYTm
         68/ncZ6a1gvMyQiH11H5bAtUAmTf1qfaAVCGZ6e2Sr0lsNdXQMqgVa66F5I9i0eNHwpv
         syDLYuYuj2tTffKGtk9A5mj5XuT6Ib2fdMw9rOTHp4B9MURUDNExMVz/3ZaRCSB+2sVq
         NyL58M5p/B2mB7mudAxoQXsTg+q3fQWhZpSlQkQ20fxFCqzX2YYUfAT2/BGGpsQBPFLm
         dwtw==
X-Gm-Message-State: AOJu0YyOU/z6UJYTCGp/R9u8xKahkZDEiHOAxepyu3Y2vXKuJvJBAdoZ
	XqyOfQZZEynNSpe8IvahwgrFBNs0GtRpycEZJN0nfh27uPHFwJoCkqqkZbwPUIcN9CfUnMdaEeM
	3+fAb/qLpw+o16oN9KcS8LHz9fhrH935PCP+jOQ1+c7taIVtYDgrDuM1+81ld3rNK
X-Gm-Gg: ASbGncum5gtq+JqLmU1tsaBFyXXQ+mPd5fGryQWzNhi+/yD9HIMjz+N7mcLNQyrfpkt
	N1RnwGr8doutMvnYoWCpVm6RkDnYPs4X9BE4+L2UGDCh1Q5FEpfcyEEhpXSXqYHz2Xaif6/UGYt
	GaRlzrgz5bCatcMt9hY66oibUvkVl94rPNLm+db/W4fzUS+KK8LH8b4AJ/yHPcycCI4QBKh2liq
	5Pj5nDZz5nl2AwaL4wgWBNunxd88YRESITD2NFR3FrcbX6KI2b8RDcgE2r26rveIlZTF/Q0KXCm
	7dAz1qmIDRp2+ow5BEoDac+GPeN6m+w20hcr5TveAvRNs+00tBk/C/Ib1dmgTGIbrR7JqeJ6J+B
	znQTbs9CBiXh78SRO6augueLYQiXmJWs=
X-Received: by 2002:a05:6a20:7d9f:b0:334:9b5d:3876 with SMTP id adf61e73a8af0-3614eb3a0a2mr1425243637.4.1763701257978;
        Thu, 20 Nov 2025 21:00:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhujF5cbGslHO2+GEhYqVOk4N2nb8ss2vvcIZdQ2Av8HQyiwMcln7gN6Z4wcWAY6AF5s+Vuw==
X-Received: by 2002:a05:6a20:7d9f:b0:334:9b5d:3876 with SMTP id adf61e73a8af0-3614eb3a0a2mr1425194637.4.1763701257368;
        Thu, 20 Nov 2025 21:00:57 -0800 (PST)
Received: from [10.231.195.11] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75e8b37f1sm4223375a12.14.2025.11.20.21.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 21:00:57 -0800 (PST)
Message-ID: <3f355c8a-5bf2-4a74-9b35-daa8ae479736@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 13:00:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: frut3k7@gmail.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        quic_yuzha@quicinc.com
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath11k: add support for MU EDCA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WeUBqkhX c=1 sm=1 tr=0 ts=691ff20b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3NV70glMY_Z50JQCx6wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: KakpjEmZoyrMlWWwI20QcP6l7IS8xExv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDAzNyBTYWx0ZWRfX+HTJgH920GPZ
 ZcI4gXu9kfsmAAT/8b6LEl3V+ClaRhOqP8kOdpJG5rrBFeMpw5BDjntwBGaOp5AX0KwxuSoWKrz
 jtHeDLwY/lm1tHH4Br7TesjYNKw34Y9iGSpw7eSSWbB2mrdJWgtJ65R91I6G4jWynTg1aEWyNKy
 xL47AxW7mPWXaVgHsj7XetAjnhrP42v9voE6TWXTi5X4x5GSa+i6qTP6f6x9mRmRdPCfyhdpw/7
 iqN271Wtafd7tHtggbkMIlKEJcWq0xuBIJ/nr5uCb2nMieCG8jLTWA7BaHK1n4mQFNoXm4QLFD/
 zsbfBDerI4ygnXQtlAtQwO+Y7fNLL45/k3Sv+QOzbzWPCx+wUoSwXVsY4/7DRmPZ8QUDqNX0Cq/
 MmUPJFtbrBdYNqOpymUIDFObpp2Sqg==
X-Proofpoint-ORIG-GUID: KakpjEmZoyrMlWWwI20QcP6l7IS8xExv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210037
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_210101_237370_AEB7A24D 
X-CRM114-Status: UNSURE (   6.18  )
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

hi,

 From your log/calltrace, I didn’t see any errors related to MU EDCA; 
what I saw were related to SMPS. Did you also add changes related to SMPS?

Yuriy

