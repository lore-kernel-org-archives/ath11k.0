Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B2FE7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 20:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cn60/1VALbVSHyxZswztHQTAh6tMGf69Zd26GEOzv2Y=; b=h6d7DEaLFQwyBNFiQ4RxaIQTXT
	79gPSAOxu19zN2UE0y8XXeN3SE+vk4ZgP9G55ssa4iBDcueDOsXIvXK3hQez0bsF2BvxOQx0WfOjm
	to4Oomeabj/xuGOeMkDyrZUnef+cwlE3HwHzQSDxfslDZQ2ImJp6+yyBF8srd6LKtsrrPugkCiYYg
	HvLFXEExCoT+++y7hiHV5BHeHihn9CtfDhFqp7FHIcWGZ/z0gX9sAd4/iDqqoUG58TIS1Gcnknz3Z
	UP3Fr9nJVib3Fyev1VYoMiOA5/gCBFsDSWt9JVfxVvJcOCBW4XaI9xlipk+TZc2jWqDfL9nvHf9BH
	JteIwUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpbH-00000001m5P-3nqx;
	Thu, 12 Dec 2024 20:15:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpXc-00000001lQa-2qOo
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 20:12:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHEQi8019578
	for <ath11k@lists.infradead.org>; Thu, 12 Dec 2024 20:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cn60/1VALbVSHyxZswztHQTAh6tMGf69Zd26GEOzv2Y=; b=euQmEP8SgwLi6gXb
	7ah+4x7z6Yof1gNodNdEdPHtXTfHRlT8ksysw1bBm9TIG8NuycmufO9uU7anuPhX
	RYTKUFc9ssxPsi2yP5lgX/b6ju8xEJ54PybTohuOpJ7+/LSzm7ONIOz18O9QXMcG
	JT2MyhRVM0DsidpC5qG+F/9pIGO84RPCb87LDPrt0DY3hy4PuecVCP7VMc66tsDp
	GdD9+bDqHJD3TbUOR9F3hhte4ZtFvcauNcmtMUDCuGYUihk0ykL+aRo/tsAVavT6
	YSuxc1MzHosZ0XFNcwiwwjWDm6Ik2dhTngov/mTU6vewIlGEe7HWqk3twGZyfIZs
	iRV1nw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ffdyuq73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 12 Dec 2024 20:12:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-20d15285c87so12246745ad.3
        for <ath11k@lists.infradead.org>; Thu, 12 Dec 2024 12:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034327; x=1734639127;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cn60/1VALbVSHyxZswztHQTAh6tMGf69Zd26GEOzv2Y=;
        b=SZCKxsDSAsjuhy7VbBnrFFDZbTHyDqaIeTu4r534tvbvbkDfPCwmjFKwjrA3soFLeY
         2TPNoEOFTTqaupiacM1RhkXisRaGfqhJAR31E/tTUMmMPl/1i+i0ruLwStug2/kfEepo
         ckUgGhhb2I2J6VETdT1fRrsmlqYxO9SeD0BXzP9Ev9Op4Go4oGWTPx8iV/vfLRu40Pny
         1w0o1aHYBn6sc6oZpmUcHAZt7Tkls6zldE/LzV/T774O7g7Ge1PZmLGFhqDcWEgvHx2B
         1rFr7VCcOhW8ZHe60fSGCsc8IVb5nbC3SGLK7ES0xsv+0cq1baFrIOpXUkoPyiKAHxRx
         S9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXMJbLrqqH9jMBAmnYKsBddlTkgdvrKwNc8UsXlE1S6w8i+N2NopKf0McLH4k9mn2qbF2WoW0g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/iw1HiO9A7qnS+gIt3dXh+yC/fwsMvVcLgIW4VvMklhrI8Pb8
	nZaa3VFY8RjwXaC+MpceeHPFmsLduaLAK3Dl3iVBJaShf0rVdo28GhDa3F5BKdX7q/QILc3zfwo
	Vr0TsiSFD1ICHSmv7/OXSVsS501Rccc0Nt938nXUoBcycANo/IRHKS4KFYe78
X-Gm-Gg: ASbGncvmuMkntPyck84W1PHEE/Q7rRVmPVB4PKwiYPPFaQ76mpx6EoITCK5C9vld97k
	X+hWmZqOCcXPgBYY7uDysSTDFuc0sogL081Nxc083FFpfZA61A2U5oGAg8bu16G4oPWxGjZRknu
	Bonla4AwbuU3NmSWK0XcrYvSd7yaYdDf2LcVbgcMgMYO81tvidXP2J3JOLx50NlPVoQOen1W/YM
	e7aGl7HXpqapS8SPHoWkl6F+0A1MfKUZMRuwuGaEF0FTl72IPJu87NsJTaprY2P6YDxQIUKfbr8
	jB7X5XuW95q5l9hFnuq7Wcksyp9JEWaW+uuna91ns3z5cj6pWQ==
X-Received: by 2002:a17:902:cf0a:b0:216:56c7:98a7 with SMTP id d9443c01a7336-21892a53c03mr320095ad.53.1734034327004;
        Thu, 12 Dec 2024 12:12:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQnkV60nuXYwfd4uSDUWCeLS7eRkdx9f0zXNnaVtas+WKnSX7+ic35la0rrPuCP3CL3PVXbQ==
X-Received: by 2002:a17:902:cf0a:b0:216:56c7:98a7 with SMTP id d9443c01a7336-21892a53c03mr319665ad.53.1734034326636;
        Thu, 12 Dec 2024 12:12:06 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fc305dsm1696109a91.52.2024.12.12.12.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 12:12:06 -0800 (PST)
Message-ID: <e9552968-64c2-4e98-bbcd-37a7498422ab@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 12:12:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/2] wifi: ath11k: Convert timeouts to
 secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand <shailend@google.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
 <20241212-netdev-converge-secs-to-jiffies-v4-2-6dac97a6d6ab@linux.microsoft.com>
 <27cc63e7-1a63-4ba5-8c7a-12a78ad6d9fa@oss.qualcomm.com>
 <cc1d5e08-92e0-46d8-badb-2a61482200cf@linux.microsoft.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cc1d5e08-92e0-46d8-badb-2a61482200cf@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JKcMG-cZaT8Jfa1ciW3oS9sxiuAPzS4_
X-Proofpoint-GUID: JKcMG-cZaT8Jfa1ciW3oS9sxiuAPzS4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=933 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412120146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_121208_725496_2FB790F5 
X-CRM114-Status: GOOD (  13.41  )
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

On 12/12/2024 11:17 AM, Easwar Hariharan wrote:
> This is some sort of weird interaction between b4 and git send-email. I
> used git send-email to send the patches after writing them out with b4
> send so as to edit "net-next" into the subject line. It's good to know
> to not mix the tools in the future.
> 
> I can resend from the branch with git send-email directly to avoid this
> if preferred.
Note that if you have a recent version, b4 prep --set-prefixes can add the
tags to the subject (and keep track of them in the cover letter metadata)


