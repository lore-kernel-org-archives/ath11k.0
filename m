Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB00D61001
	for <ath11k@archiver.kernel.org>; Thu, 29 Jan 2026 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42D4Yqc3Zjl6wkobPB6JXQnteYWOrIpSff9Z6J5iluM=; b=ov38WQChg7wRr2tkXC7MSw0qAG
	5kXj0VEbJ+hN2F+0K727Bcqq/ZdduHjFErugbsjo88ORM/Z/SEoXaoOSCaytFsLZYyZQzT1jMQuSC
	z/msF9qV+XLf93dMFmwQj0MEwNXpAPltvZ0ybIK+XT4pwutEmnWt3yvuNoWwT8iLGuXt/CvE5pFpd
	ypRB9WCWI/vG+i+piZfvXeKlFvxemiJsXz/WlUexa4nn6GqDCGu7yf7OVjmZhq8JL5n3/VHQV+xZi
	N8SMUcYiGq0X1/7D8lVm7rQZueSSwMjUGBDWZ5IrENClWQJl4GOGCmddqMWR2UIT/EJhS8CKZKr6k
	iLfoOo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQ28-0000000023h-23aD;
	Thu, 29 Jan 2026 11:17:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQ25-00000000232-0AuN
	for ath11k@lists.infradead.org;
	Thu, 29 Jan 2026 11:17:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TA9Zmf2060686
	for <ath11k@lists.infradead.org>; Thu, 29 Jan 2026 11:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42D4Yqc3Zjl6wkobPB6JXQnteYWOrIpSff9Z6J5iluM=; b=YoNbLz6/fOuqh3kQ
	uw7DWabpo1ARyYCtEN7OOH7L1FjLx4SP42WgmB0FIM5js4/eHw3LSrHBiBE3UPM3
	ouVPYv6r8E1av3Npg5JikkRn5YKpyTf4/o+MW/n5co8qb4NFSOTlbV4K1KUme2tX
	SSvmXxQQLNffibRBIm3FqsLrFpZ9HhQIlcUZFh837otCakMiAKWuGb+l5x8V3nQr
	RC1+U2LMA5pQsRurkPmi47zPEgmUvPiSvifrxTkbWrulzyf/MrHQkQHo2OJghUAG
	2XenEdJBvBF/cjWAgGlQx8gzEMOUw/S83N1KV0A3fGNk21xd9T7L6pa4VxE0OY2m
	Ik5Nsg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrk65r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 29 Jan 2026 11:17:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-352c7f19acaso699568a91.0
        for <ath11k@lists.infradead.org>; Thu, 29 Jan 2026 03:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769685471; x=1770290271; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42D4Yqc3Zjl6wkobPB6JXQnteYWOrIpSff9Z6J5iluM=;
        b=XKUsmnD01yH1npWVdL30QpGQFwV3HXZejSNOx2PJf/i/j2JbwuAOEW5jZXQO6eCwEi
         6aKh9+j6B7zh5oGladTLcSiSeQxGztpkQlKEmII6Za8ZW8wmcHGEsDYomUnQNZ3zVDo5
         UjkkNl87ADB69rQQFNIT2xLSQCaEXOF2OyvSMdDOzkyj8NZwdNByOOxii+K7zS9vK344
         S/mry7fneRV0tFeuHBAghCyeqHpmJsSEw3HCFadakVJXPjmVhaBhng25API61ZH3ZefX
         DBuOI3wDZvLJydivhBFsLFVLv8dDJHDMxov2z3LdFZjK4uo2ZGpyF0NxUsPhzW+UIksJ
         gDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685471; x=1770290271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42D4Yqc3Zjl6wkobPB6JXQnteYWOrIpSff9Z6J5iluM=;
        b=M+h0UEqbxcJvGORORJlD4/VhvjJ+mpEOh0uZVir6vIkOGz0MlU0e1lTP9WE6Lp3Qz5
         ahy4xkQr4LGq7WAe5pofLOzTa3ZFcUUhD3cuNc/Ekl77yGEfwA03zjw6p/9d08JjJl/M
         e5c2I8HUfuVRpj5mk1Tcf+n5BOKRth+u16zt38fHWbfNHOwIX2lVQE2roUN9kGoQGUvi
         QUyyh/MlN1+bv2Ut+bW0PkeR6JYhHwvIPym+aG6eEHASg/E7pXm2bX+6ttQIg18vg5a2
         xL7cSLlLiRWz4/+/5guWUvA5xiyxYeaK1T8PumkC2wRr51dE/hNoDcCLnq6ZwAa5nIoO
         slJg==
X-Forwarded-Encrypted: i=1; AJvYcCXX+oZr/MeYTLMxDguddkofk912E7mKJy1preGdxzta6h89UvLQ7pOEusGnhcED84c8LMAU+fc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxMLW0EZWwpOPPxY5e1W24XdjnJpQGv4GRRp0k57eEiERNaCqh
	nlMIsBwryhIG0PWhxvOKVZPOmsUC9rKqJ6q6k8A0R2RABF0qdbR2sz7PI2PEtMRhoCRPj7AzaCB
	ftDmzEeZ0ihWQbsqw9N1/KfQPCtmUE554yFiULVJf4Tj6uQrtIWCIRCBdNRl+vM+T
X-Gm-Gg: AZuq6aJQATe1Vy2nBR0l+2ymzk8/LKy19gbG11rQ6ZXuosDKV+3cQxAv3cNQhizt0Xl
	FujLMJHLFsEFZ9UkwxMb4+l/Vxksh17tMzp+pSnw914svxXIjntcG+BZpLyLXbSFAcjguxkXwkC
	zp2jH+2jxKXcbGLceA7mpwMq6PJEwWpbC/j+eR+BqbSW/piKvxXBEJX9b4qx2dFNpGUY1JvAaWH
	ffuE2khjyeisEAsPiRZbL/10ciDGk5G4ihbn3gbV8YJAXDMS0DdP+SC1aVWMnDK24jxj/ECtjXZ
	Jf4cNXHa1m9FtNqi3puxo4W2srAvHv98Bt01Mzfyt5EsztXfFHUS1QP7TNEupfLec0p/4dA5Mud
	uUiiub+ymoTrCrXYDiKIhq7sdhMjkuJHqM7oNy5Wx9EduolHaWnKzm38=
X-Received: by 2002:a17:90b:2d83:b0:34a:a1c1:90a0 with SMTP id 98e67ed59e1d1-353fed87a85mr6962688a91.28.1769685471369;
        Thu, 29 Jan 2026 03:17:51 -0800 (PST)
X-Received: by 2002:a17:90b:2d83:b0:34a:a1c1:90a0 with SMTP id 98e67ed59e1d1-353fed87a85mr6962659a91.28.1769685470908;
        Thu, 29 Jan 2026 03:17:50 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6103e9fsm7934690a91.2.2026.01.29.03.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 03:17:50 -0800 (PST)
Message-ID: <f30be082-036b-4554-80b3-da1dd19d8caa@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 16:47:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ath11k: support IPQ9574
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, jjohnson@kernel.org,
        ath11k@lists.infradead.org
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260109044457.3074510-1-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260109044457.3074510-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697b41e0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VFJI8iCbsL4109xkWtAA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: vM9satwXCuVj3r17jPS0y1KjLoRPOBgQ
X-Proofpoint-ORIG-GUID: vM9satwXCuVj3r17jPS0y1KjLoRPOBgQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3NiBTYWx0ZWRfX69R+JAoB7Hrj
 bnmpLGHdREtT0wnbPyLsMvWZ8nuChJiKHrUCBDZO2ZZRMy572wYY577lJ9N3Z3vuePFlbRcXT1r
 lUzVO6ke3p5VBce+0GDR6LNjJP7f3MJO11LmWDaQkhQkNFJQE1I8rl9ZS4u8CUGW6+oUELe8Uvi
 FX/sLTHeYbffnUgPwEP/wCf7vV/ax2WX1ndP9IOlZrzcpKyOwBJO/vrIyOQYlcn2kPeaMLdlv0q
 T4NYiB3Bn06hw4LXbBx2AreC2en6f6FaJw762FQ/DirsrMY05CvfAbbgHMLy96mr0XFjhYvtJkN
 9lZ6JFQPA1jaaSSyBHFd8NXbvZ7piobrd3s5mixpg9mbyvJNAGYK7LO8BtA/Y9xfg1Y9nbD49cH
 Pa1X0wm8ThIOQPKqVg0Z3GleLlmAgki2aRaRXKYAxwaffDSrELqGrYNrEBSMFwBwpl/vBcmI//4
 2CpPXgRzrcLjWDr4xoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_031753_098319_B0008C0F 
X-CRM114-Status: GOOD (  14.26  )
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



On 1/9/2026 10:14 AM, Alexandru Gagniuc wrote:
> This is my attempt to make ath11k work on IPQ9574. IPQ9574 is intended
> for wifi-7 devices, so it seems the exception rather than the rule to
> pair it with a wifi-6 chip. That's exactly what my Archer BE550 does.
> 
> This consists of a wifi-6 (QCN5024) chip connected via PCIe to the
> SoC, but exposed to the OS via AHB.

Pls note that IPQ9574 has internal wifi-6 which is connected AHB
not PCIe. Also, host driver does not really need to worry about QCN5024
(that is not connected over PCIe either anyway). You may also want to change
the commit message of "[PATCH v2 2/2] wifi: ath11k: support ipq9574"
accordingly.

Vasanth

