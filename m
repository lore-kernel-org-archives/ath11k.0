Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002C9D2502E
	for <ath11k@archiver.kernel.org>; Mon, 12 Jan 2026 02:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6c/VxHfpcmIrMLF9ZDEPMqOWnrf58TnzdCmvY0qMQ6o=; b=agVUcTyvig71blqb+RI+7KTiKh
	dAWyxReloolIH5LE9brvuZubsEnApjYo99eL/y3pb0DYhX2STfSJSWM7wA0RVnqpGY6v+qvownld0
	9ja5Zg6isaL6UqCpCyNFgW6MxHVN1wSQiUTCTOfhOIZiDXa7yyI/4eK0W5C4Fuig/QYaETDQh2Zah
	k7Sx3AbSxYPbu7k01wqki9PNfc5bWXVeBXJdw8ko77aJqa/PzMGIBl54nrB8lJU38UBE2GXzAn6nJ
	9E3Zy+qCV6e9nsNAJeH444xgcVthgKUxZUg5RrhcbD/g7JQWIlX2oKxyKqM/8VzmFmC/AhoKedMCS
	4iQCmPqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf7mm-00000004g4E-34rG;
	Mon, 12 Jan 2026 02:36:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf7mi-00000004g2i-390r
	for ath11k@lists.infradead.org;
	Mon, 12 Jan 2026 02:36:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C2Nscq113479
	for <ath11k@lists.infradead.org>; Mon, 12 Jan 2026 02:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6c/VxHfpcmIrMLF9ZDEPMqOWnrf58TnzdCmvY0qMQ6o=; b=n5gzDsIqHp02vjZ8
	FmSe/RNQExJ211IlsRjfKa0BtWLfdc0pCN/sbfUfRqTEl9iCEOzMPdKkHsAiP8Qc
	HRFtSwDR5WA518w41AvAv4b4XPn/3747S2S66bKkJ/bw142dWZimN8Y/hVKCJ9vY
	7mf+vYyrLCJEMVdMe4neNg0PZhYmXfEpIia49Y7cdyoQvZuFplMtdcFo2032cp+v
	uG98w5GgA7yNVltCzI+i6acGMRN1tHWYfr5hcQ1VisaFwLAKDrToik2bjlK6841u
	yHFsJPBx6TYzV7d0NFGFewLwUAq8qTmjn9D8SyXqDCKR4gIL4DGbpEjqjn1h/5RO
	1fCkvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4ug0vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 12 Jan 2026 02:35:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a351686c17so64760125ad.0
        for <ath11k@lists.infradead.org>; Sun, 11 Jan 2026 18:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768185358; x=1768790158; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6c/VxHfpcmIrMLF9ZDEPMqOWnrf58TnzdCmvY0qMQ6o=;
        b=IIvj1QGBtVxm1OuJ2xCyj55qULITBvi8uD9btdEzvdTR5votlFxQSOQ4T+Nn+ePalq
         /7uRjMmCggZbUiznBHMv7A7/qWfaXMJKbKuIGv/QT762b9dzOzGTDdxrKpmuOo2eXqty
         GiYKdhqIsknyEbnjQ1sqy0/1fVd7tE5v+2Q6FrYZwwY9fRXSS+vMfU6GUYNQsUwdvuSB
         G0BSdgaBhjIdiPO7N5lxKgX9IL8ZEllWThSlTarUgSmzkKECCfVqReHcUXALr970SmxU
         HO9NmCUAzu6VV2bgaOQyWubHTrOnSRs2FnX5uJjnSKwz1VoY4NspTXzjHn1acybdf2ul
         yi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768185358; x=1768790158;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6c/VxHfpcmIrMLF9ZDEPMqOWnrf58TnzdCmvY0qMQ6o=;
        b=Gq4HgydmthRhpt7nEdlbFr8BTMU3euD16DX8+4ChLNGh9CRZZfa+jdITCk5tpiVGdk
         P5e5iJB2vmytbV/C/miFKQKri60mAgXGvKSml7jD8T+YFWd+wDlNeS9HHEYrM//VyJA0
         1KLPIiBIoawOrR6XibdCQ3bxb1UFTkY6uWFf92t/Qk8W/BLMXVghL2pneykr5xHUwjXR
         1xUsgh0zgK3fAQB6eIRIviS2FLxYykzuDl9zFzM+vmebtrTHGPv9F+JipL/YX17m6a7t
         SqJm+/bAJ9mEnepy6Epq066UcT3TZS6oIZTn7hFLWOZhnBsQhz1ZwfTNwQh5MAtZLgmZ
         wy+Q==
X-Gm-Message-State: AOJu0YzF54dcmwdbg/5qG/OQby2Hmak3ugL3O9xqvrkISF0WI3RodZCt
	51bXUZAbGkhHgNwwoDpuj8IPi6qUz8IXXg9INjX2d2My/eOwc6x0sVElfvKZqiWNJnK0u7SoCf8
	GAgmShkM20j4/KKNVikX9T7KutWpoDVY7hY3gthoZlUHCbu584qZfvYPhWlHiUnXj
X-Gm-Gg: AY/fxX7Jxzp/h5PEmruRh5sKIn32sitRJ+ZgxapTK7lRaZQPmARlF/Z0jyRnoRwqoJN
	HtPfZTbdnm6Dfyo35hPmZbeXAa08rmUPuG3Fx8ZBeafASvPsxQEWQolWc5EsUEOPjcf5Y2ZBV2x
	9eNB/wCP4mRm+T2PPNVw4B5u5m3L1lRt502jBJzHzSf1bQmi/ZHKKQnubQAlMGf5JPMkyHo+2Wf
	HJ0aDTbaVgmAePf0/wImE7z/K0N+k6JpKo5FXJ6H1iwP6S1D9ulTMD5en+fp5dm2MX5aV996BN2
	g7n1qFmEtFjpGKG40YhhYM2WCVm9NSHEHs5m+9LENrdD5GcN3+sCEQjtj1OPK0JZkQFw7wsxGFU
	Y7aIqc5jWyjCnWVlzucVzq5/+bW41GzUNhn9Z8m/YbwE7pgLhgQLxogHWNb97szRcjm3vd7ujSO
	HvJFAQLA==
X-Received: by 2002:a17:903:1a84:b0:2a0:be68:9456 with SMTP id d9443c01a7336-2a3ee4fed1emr135794695ad.46.1768185358198;
        Sun, 11 Jan 2026 18:35:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0qp4ogLpHOm8hfOd9xEVDvVklWm471t9sA5BmCY0MQQMxcM+W/YeyXFJQY2BqpmQzYKgnDg==
X-Received: by 2002:a17:903:1a84:b0:2a0:be68:9456 with SMTP id d9443c01a7336-2a3ee4fed1emr135794565ad.46.1768185357692;
        Sun, 11 Jan 2026 18:35:57 -0800 (PST)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f88casm16045651b3a.34.2026.01.11.18.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 18:35:57 -0800 (PST)
Message-ID: <09b6b13b-2b88-49b2-b865-f70996708c01@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 10:35:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Add quirk entry for Thinkpad T14s Gen3 AMD
To: Ilya K <me@0upti.me>, tiwai@suse.de
Cc: ath11k@lists.infradead.org, jeff.johnson@oss.qualcomm.com,
        linux-wireless@vger.kernel.org, mpearson-lenovo@squebb.ca
References: <875xaypnkz.wl-tiwai@suse.de>
 <b410fa3f-0241-4805-afb0-efb950e04bd2@0upti.me>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b410fa3f-0241-4805-afb0-efb950e04bd2@0upti.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyMCBTYWx0ZWRfX6kPiRvk4TCod
 a9lbSxfAdRc5t05XcyUNruJKB5h/lEQBJgAccwKkwD4+xTq12V3fhlwGOJdghPMTIpUt1Kwphym
 58QEOOBG7cBPLVe1zF1ozws3MJkOlV3l3WRJOf1MyVHu6uq8CrEeZqYmHYjeqjepRzVnCxk8a3T
 wItdEDc+SYU6IQoWKGH0cPgtK9Q/npbdXquADC2315Vo9XorkaN/aFhGbBhhYcLfKXXqqDKykCA
 2lvtWStAeFqOemLdFoFatBMwGvUAD3cpW1karJtbYt7FQtweKES58+Xy2JiVWNCmdoO9Gw/o8kf
 zFR1TLN5CnzAV+zMgKy5Gl0ThHzW3N56kGSTInJF2g2jwglgGVBDFmdwdYzoXQkLdHYBV6k4/RA
 lFT6vZ2bz90XFuk9FiEN/VIyJJNyLPn42I3tkMCXXRrhQwp6hEtJhDlVffbkBZ/b8WGUVrxQR2m
 aYa188VsCY9GBKDib4Q==
X-Proofpoint-ORIG-GUID: 7MXu7pr-9ZFtMCb8DJ65iZ0B5GR5fBsj
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=69645e0e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mmW_J2VSl9LesBZo4rAA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7MXu7pr-9ZFtMCb8DJ65iZ0B5GR5fBsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_183600_817882_864FD904 
X-CRM114-Status: GOOD (  13.35  )
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



On 1/11/2026 6:47 PM, Ilya K wrote:
> Hey folks,
> 
> Sorry for bumping an old-ish thread, but I've had the same issue on a T13 Gen3 machine as well (model 21CG), and there seems to be no better solution in sight.
> 
> Also, here's another instance of what I'm pretty sure is the same issue: https://lore.kernel.org/ath11k/6268b094-5a40-40d8-8461-9c9b0f9e1ae3@oss.qualcomm.com/T/#t
> 
> Can this get landed at least as a temporary workaround? Also, should I submit the 21CG quirk as a separate patch?

I had an off list discussion with Takashi, and based on the logs collected I don't think
this is not a suspend/resume issue, or even this is not a STA side issue.

Before we conclude whether your issue is the same or not, can you please describe your
issue in detail? specifically is it an unexpected wakeup or is it reconnection failure
after a normal wakeup?


