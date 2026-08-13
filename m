Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F811C5CFCF
	for <ath11k@archiver.kernel.org>; Thu, 13 Aug 2026 16:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5cRTTHqlksMdYebDLk7D8znUq+PbG1zkgFfzQmI908=; b=Srn69SdzDv35TLb7QpeeLK3F2/
	kppznRHaOatlDN8eBLoioj2K4tJjTHLne3kofwxke7uKmUaVnXDXEK9lrRb1N6paRuf0zqmwKaoBy
	dJg6gle2S98subd4hYcaoJwn8mVmRQtL5TODL8Ek6VYxDY7cXlbtI2Iimr7+KqJ8zZAJ9dH4xnmsU
	xBgB5wEM/xIJT4dqogzE298/+qHUNkUck4Ku4OljecyJwnPVjYR+NOmFFiwV21z9eGJnb0bFd782R
	xON0ZgPRdpFD8EiOuB7DTIadgCr9Ye12Xvs2G1qt9iTluYdlDu+B3hpgN4xeLOmQTBOQOFVaBUT2e
	4/ZNsubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYDN-000000019JJ-1efW;
	Thu, 13 Aug 2026 16:23:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYDL-000000019IO-1Dba
	for ath11k@lists.infradead.org;
	Thu, 13 Aug 2026 16:23:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFwgZK3248788
	for <ath11k@lists.infradead.org>; Thu, 13 Aug 2026 16:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H5cRTTHqlksMdYebDLk7D8znUq+PbG1zkgFfzQmI908=; b=HEJTsvbsQadE5buc
	5XAkfNmgvnlXmyjXSSCddV36MzoP3oeH1KhWVSWVv7JgZsNSzsQnHRR3b2ahTXKF
	6T7zR8V/2R2JMtE5qUmNHMyrr6+yyaXVI7Kp2IY/4ML5oRVB789HemLdWfNeR8aD
	iDg4g0we8RrveyGdtXc1Oo55HzayLpZIm+M2kxknzy6NhAswBglPCCIk4UrTwUed
	nXy5KGyfPQLH+cmL7uTT4ad0/Mi5TK4+PmjazXsSOeThO0zILyJpvAoedEUeDK+H
	4NTvcA5G4eRHiJxBcQ5NeJws4pI7pRm7QyQ0YRZVKVeCX6WQsh4/bzMuapC9mbUC
	lMWedQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1ur4n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Aug 2026 16:23:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce8a76df2dso1738495ad.2
        for <ath11k@lists.infradead.org>; Thu, 13 Aug 2026 09:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786638207; x=1787243007; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H5cRTTHqlksMdYebDLk7D8znUq+PbG1zkgFfzQmI908=;
        b=XQV498dzQKNq0gNIDWOrE2osIwli6XbeZVlmodSUwsUf+6k1a21mLKfc1NYTaAwjMB
         KOsqkK8UJFbbL0AjXQgNlFgceeijFat5CB/Q4FCprpNc1YaxZdKjXo1AiVfV57pHmR3O
         E37BBRDt/aH1jpOyboyJPsyPeIOE9py9y+yKDZdeNRFp2KET4E6WkdIQQNrWKMU2M6Kv
         PgodVzGckfHiDx09N+0agzROK/JOEemmubkXQ9pQZqcV3kEag78gOx+FUdCo1DeR6mbV
         JD1CLwm9XKBzFM1QivLtvFle6bsh1638dz2V7d49qWmFSYxjRtRxlQq3fr6kdnnCaiD4
         w/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638207; x=1787243007;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5cRTTHqlksMdYebDLk7D8znUq+PbG1zkgFfzQmI908=;
        b=PLQtYhtaOowVOzIRzs/CB+AeuCNtS8T2Xy4iNH2mggCZRJ8x6wTxrAI+KGqxmbk+E/
         sI2AytCsQy2KIuldwDiKd6YXyAIYVr5EJA18aUCHI+8oVnBfM4YYNwto51KwF2oAVnfO
         Pu3JGYvV8JkCDw6I1eaurtfpkAPTqicimtO8txxVyOVzToUZGarbTcBKXi9POfVcHF2k
         2rFRN+eSgDic+GIpWx2fEamWyJbCVF0xZOh6NSAI9LwvYaEoLoRNfX2SOc9SMPH9QGAI
         M4GKFT1n+nEgJVcawYTvzaZwVe0Y8NlPBltzinWh9xhyL9S3BrLx68jUOf/YDH9+W/X/
         2UVA==
X-Gm-Message-State: AOJu0YybsAyTTqGu3FR41TwRDvLLGugQDO/Xl3iLs3aZJm0aai1QoJj6
	fPQT2Kvx66cjaJXL5mWW1t40HpQ2XCvLpiN2/hzrNzZ4CqzzrF/KCz0dp1Uho6Z+oaLtTr5dU2F
	o8mxYtOKEu1Dpm3dlruCUOenasUoOUvdAJTFYuqueK+bsVuVOyrgX2hLpwsOINJx9
X-Gm-Gg: AR+sD12ziOaa/jpezzhuQsXkzHOG/CKhzBUsD8dIYJCJb60arxB8LJetU7v9DBfSIv5
	Ipz1YLfcC06xHb5PieZei0THGzqPy9XEFL6W5Fp8OoQ+OWvcm+MFSQbbEFMHkL+gyNsrUuCtGmq
	XxXI1WyAhtY4RwjXapv2hu97jlq7dEM8JpIQw1Pz/vD10GAER2BzUVMuMB4rh3j+olLwcrRSEYq
	3bwHzsxrISl+yCymwA5wsyDOr12YfYOxUNNCBPLCrtYZNTJ5PuGy5K9y49mOFWoxUb71vA2HPVC
	6iFXFWc0Np5fXKK7RrNt3PtFlAg13xB6RtuLYUWvZZ5Zbpzv/UQuLiYAySap9oSgbhqHyf0ne3Q
	M16FXyKlA8He50DaHL2472inWyfAjyJm3Bg6npCz9rSXDfFeYFPBEzOH0fipK
X-Received: by 2002:a17:902:d4ca:b0:2d1:1f73:3667 with SMTP id d9443c01a7336-2d37d538406mr75749125ad.1.1786638207322;
        Thu, 13 Aug 2026 09:23:27 -0700 (PDT)
X-Received: by 2002:a17:902:d4ca:b0:2d1:1f73:3667 with SMTP id d9443c01a7336-2d37d538406mr75748325ad.1.1786638206748;
        Thu, 13 Aug 2026 09:23:26 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c2000bbsm13062545ad.7.2026.08.13.09.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 09:23:26 -0700 (PDT)
Message-ID: <170a200e-f0fc-4e8f-a7c6-72294beb185a@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 09:23:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] wifi: ath12k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <0b72231d-59f8-49bf-82a0-76d2c7862729@oss.qualcomm.com>
 <20260811111405.397112-1-jtornosm@redhat.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260811111405.397112-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6GGgvW2Oe0F_Z3eJTTYIR5SVIPJO_Zc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExOCBTYWx0ZWRfX38T0ePcSJmB1
 A2NO/D4pHxr1YAir0HH35EJ39hyweaL7fhp2NXLEBaTpV0bp9ET/UQZois9GF7GZO8UsDwAPSpH
 jvg1JRpO7e3Cc9/L2pWxLuPJFK6dWS3jz4OueI9LfqISjAt+w8pFcf/oEgYkHtGJAlsz3deIZfS
 lhh30QzoDM8jKebgofZuK4TRQ7zd1j6vhgPUDE2C4m38qZVtVKLWXYmua02tUsSQFuMlGMr/BbJ
 gomy/42HdAzbfS5aDmACOnn/z40F2wYJ27wIxA1kic3gK8yzexUUFM9EkLo6NcjdJBDs8n0peKF
 ph4k6e9zPYUAkd9BDCK3Ohr4F5SAOjRvjvmkoN2M92W7ya5/ZyKtBnmLxIB2s3w7tRVq3EwRs5z
 lwJ901yc7SjPTeMVS93iaiyY2geJj9o+Moj2doab2fbW3uc8r2wGLoovbOlVNx1N2QSKoRs3zD+
 vSeYRY5XjmOzOjA57lw==
X-Proofpoint-ORIG-GUID: 6GGgvW2Oe0F_Z3eJTTYIR5SVIPJO_Zc2
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7def80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7Mwv2mn7B_PKH5WITEIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExOCBTYWx0ZWRfXxCHHOmRpHCG+
 T5a9cWTgRPWkdyfKpN7XLHz5ZRfI5XealvMu+goA+3PFCMiLPjuWOPsXuEP9dtpoxHYHW+2sK8j
 xA9HCozIkkBTw5o0HPKd7XMETMJcbfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_092331_588697_CB0AFFCC 
X-CRM114-Status: UNSURE (   9.28  )
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

On 8/11/2026 4:14 AM, Jose Ignacio Tornos Martinez wrote:
>>> +		spin_lock(&tcl_ring->lock);
>>
>> seems this should be spin_lock_bh() to align with all other callers in the driver.
> 
> The outer spin_lock_bh(&tx_ring->wake_tx_lock); already disables BH, so
> spin_lock() for the inner tcl_ring->lock is correct and sufficient. Using
> spin_lock_bh() would redundantly disable BH again.

Yes, but if that outer spinlock is ever removed, the inner spinlock would no
longer be correct. So the defensive pattern is to use _bh in both places, and
both of my AI review agents concur with this practice.

/jeff

