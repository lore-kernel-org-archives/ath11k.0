Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D722E67A63
	for <ath11k@archiver.kernel.org>; Tue,  3 Mar 2026 05:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bA8xktglxhZAwC8CMfnqSCa/OaZJ0FxXmMSuRce0dHk=; b=0RsDXlQ8BipXiEyLgU2pKf08CZ
	VG9pG683gq6ypPMG09xg5PCwVvSBqTY9OUGsogTOQt1rp8y0yN/+bZPmxbDv1q77BuE0kiQzrxDTJ
	rD+ZDRhfDp0G0hxhTqfHr/J+HqWIFuX51ZVUwS8ghj52nMeZIB2eJ4C/6Ypl4Q3iMfS7F/EubEqOL
	AcKWvvU/MJaijFYWgC8ZvVFt9xGRSRCVhjWBK072kf/9ZkFQ4TmA7GZQvJFjI2ruNxj78uBnBbS4D
	d/eqL5QB/lhrawDDTn3AmN7aIk/Uk3E+oTw7PsqirpvWojv5YSTJKzF+Feq737nrdTiPBwnxjK2Wu
	klpzT6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHxc-0000000EWau-00h0;
	Tue, 03 Mar 2026 05:06:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHxY-0000000EWaW-3lNG
	for ath11k@lists.infradead.org;
	Tue, 03 Mar 2026 05:06:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6230PIEK3753087
	for <ath11k@lists.infradead.org>; Tue, 3 Mar 2026 05:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bA8xktglxhZAwC8CMfnqSCa/OaZJ0FxXmMSuRce0dHk=; b=mtoEuNmcbrxev/li
	DLVYCAdpbmEllisWN/ax/AIYh/xkeI1F0Gvk5OaZz4YcVi9kpma6hXdtlkDO2dyx
	terSo5rEnUd8q7mOQ84ZClxm26LzgDBfRhFSkhxaC2gs7DCt7ceE+rIUIGcds9pl
	Y4Fgavs+f4qtfdI6g+Hx3Z3R2PhvVw5i4e2esNshvAQCS4hEKzpg1nV+K5IojKFf
	tQ0a2f9IumPh8cRj6j++MQmzss8zE19I9wFPG89sNs/1JTarHBIxSKb9X02RUZdc
	RgzjW+1c4HkbyJjqsn+V8xgSJ7AK2owrdRhLJbQp5gYYNdy7Mg4a6PM4h59ME7zg
	U3l7XQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kqbny6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 03 Mar 2026 05:06:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae467f128fso20690935ad.1
        for <ath11k@lists.infradead.org>; Mon, 02 Mar 2026 21:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772514374; x=1773119174; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bA8xktglxhZAwC8CMfnqSCa/OaZJ0FxXmMSuRce0dHk=;
        b=Vy1OPLoo9TSSpSG+DZcBTNk9ONvVhXTyBNj24Z2Qwn5HNpGD6mANt+VUm9AZY8OXLP
         C9W2CPMYP3dKtupZ7sUZekwsu8zA7V+/3Nmm7Rl/I6/u+X28M9rpSOITkvNoWMGh4sQY
         EkqzpedgrHqgSG8oFGSKxPBdHU5MQwTc9F545Ouw2TPDxCF9Bs3P3kBOW9ZUBM7/dMWg
         HyUy3fwDjtS960LJ3IotHJCdFSKwDaaP+0PqRY4pkWb3X3EprPNxQN6xMOH+mRumsI8/
         8fYFFPA01SUVZkDZU1lHSodkrhFZktBDZNpv6+o+LU319fMfXtOLWJOWYQ3vPNZc2IXF
         GCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772514374; x=1773119174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bA8xktglxhZAwC8CMfnqSCa/OaZJ0FxXmMSuRce0dHk=;
        b=hOhmP8/EGcZeZQatJhldz+Y2kXFAGOp3D7hNTSirKlwE5dpdfatdhZJ6+MP/L+jmkC
         M0RDtKy89QtMmrhV7nwpb6nQl+te9vczX9J+h4yK2ZEa8lWHpS8a2+nlrWiM52ncDEXh
         xD/Yg9AaQN20gweZPeekhZzZO6oYEY1Il6kfZfJio/NU5ggF2G/f0qI49Dv8wtitZK4v
         oyePW0uF/cG66wyDE//3j+Z/dEujmOwbKr5HCsdlZpDyKQIsTM8K2/h/ep1Zwh2xI3CM
         aJaPBigXVly7IAUTN12VsHG6C+K/nyctnhpTeJgMmIXGmglwRtUooTze51hoDBMaBoV+
         5DYA==
X-Forwarded-Encrypted: i=1; AJvYcCWRitppt4UAbEEmY0LP7gNOI8QXrnp+S0WXFxfYD/H0cZCf+iwV5n9LXQiyO0j2FKCxCab7pnY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Cjr/YSa87eNgdW13OQXnqHoefFAkiSWG486tYGvF9SQW0qoy
	qga6iK9ungHW8YUwyI5kwiCvoAdHhHVAhaAGlN9ZGbdaTHsH3H8JV/tmzt0OZX5T9lme/3Hltdv
	XYB7MBqwH6dgat8cIAfPxlrL4PvLqe/vlxVDHHQ8a+oZ2u3LdLxtfhoJFIKniKl9855ufJIJ8
X-Gm-Gg: ATEYQzxDgigNz+izaMcZgbn9iICySBTxJLodsb3qtGMRrJIQ22Tfkbr3UzfZILXXsqI
	06uBnHwY9nX2XO19jHc/2E4UGJqo0P1aBahvRjyTcMFZiPgASW7eeT2hTgadrNl6PsWWtIM4n86
	0CC2VYJ4vSGKNCzinJEvV+TVvdKSTJ+fgSBF362bPFfeD1Dv+2c8XUa0IByYXmqg6BmZBDS+BHb
	FxMAiNE9cM5Wotwu3iNYSPqsd2FUUZ4pE5u+FFXODxPgy7GaTfhRbuOTxQkb14EydfxFXytX9jQ
	aB8ZZTVbCo4LU+OjQQ5PlBbVOlnzlyGDiB/wH6bT0mK4PVyVYx1t3NYgJFPMqNU6Sknc6a9LlHk
	l342BPMyK6ouHi/THYk4rb4oYn8OF/GqQKV/vZq60WmhhV05HAHWqVyRJAYpB8f0A4oo=
X-Received: by 2002:a17:903:f8b:b0:2ae:4cb8:484a with SMTP id d9443c01a7336-2ae4cb84c51mr57687015ad.17.1772514374369;
        Mon, 02 Mar 2026 21:06:14 -0800 (PST)
X-Received: by 2002:a17:903:f8b:b0:2ae:4cb8:484a with SMTP id d9443c01a7336-2ae4cb84c51mr57686875ad.17.1772514373860;
        Mon, 02 Mar 2026 21:06:13 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4f945985sm75579165ad.71.2026.03.02.21.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 21:06:13 -0800 (PST)
Message-ID: <6c25edee-b083-4d5e-a13c-04932275bff4@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 10:36:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: A question about supporting the QCN9072 radio
To: Dawei Chen <dchen@silexamerica.com>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <CY8PR19MB76432CFEF9F0BF8862EE4D7BCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
 <CY8PR19MB76437B84E62BF9881F7DD48BCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
 <CY8PR19MB7643FC8B2AA5ED9707EB479CCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
 <5d3d085b-9480-470d-bbb2-bd4a1fbae2c1@oss.qualcomm.com>
 <CY8PR19MB7643369A3333498D5FBCF4B3CA7EA@CY8PR19MB7643.namprd19.prod.outlook.com>
 <CY8PR19MB764303EE2EFA9D9DB0282013CA7EA@CY8PR19MB7643.namprd19.prod.outlook.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <CY8PR19MB764303EE2EFA9D9DB0282013CA7EA@CY8PR19MB7643.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EN08tm789kfNSzIyNQKn775k_Nz-1GTR
X-Proofpoint-GUID: EN08tm789kfNSzIyNQKn775k_Nz-1GTR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAzMiBTYWx0ZWRfX2wpf+28eiX66
 HJBHKOVVMIHJg4oXw7ABW9IkIQL7TJuW2Mc+zfHFbnE01kxlqiLbetvgEdnLLpHkP+g1YFyE6Xi
 /B8GYu7kTvCggT/wGAUcW+8hIEuy9mmMnlcjOENcPuruj4GH/VQCdgtY6pa6akr3x4p/44dypxC
 /hexcoMH5mNLKFPQFp6fcI0PvUarKP2fzmDFFa0EUacYAI3qvBQnk4pZY/Fx5httzlQphMspi6U
 YkGg2HcdCuCEOTAvYPkWG3czAkp97Ms5+k6YttFT0JykNKh/8v4WMAJYmkSnj/uQcQsVBHlw3GN
 9a92045CTmAI3tmz5aWtj5OJi+TIvVABCs00bRXnpoRpek7wRSCY15VjdhmcEWy8HAniqmr80F0
 nmXgQHQuFCmYztN6OtJFzn1UXulzc943HxTZJ4uhHcCNtGnEys05EMgHiZifgRibsigAp0a1fUs
 Q15LoyRUdbRWnTEt2yw==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a66c47 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=BSqXoJVqd4DgX87H:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=rYL51LNJMvpkO9n1qQUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_210616_982493_2FDCD821 
X-CRM114-Status: GOOD (  10.93  )
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



On 3/2/2026 10:54 AM, Dawei Chen wrote:
> Hi Vasanthakumar,
> 
> My apologies.  It was a typo in my original email.
> I meant to type ath11k.
> 
> The ath11k source code has references to QCN9074. Ath11k-firmware files are also available for QCN9074.
> 
> However, there is no reference to QCN9072 and no ath11k-firmware for QCN9072.
> My concern is that the current ath11k solution (host driver and TFW) does not support QCN9072.

I expect QCN9072 also to work with ath11k + QCN9074 firmware . What is the issue are you 
running into?

Vasanth

