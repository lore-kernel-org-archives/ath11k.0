Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EACC61CE7
	for <ath11k@archiver.kernel.org>; Sat,  7 Jun 2025 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/fuCDH0Gwtq0pcPFkhUBL4eiap0PNxhpbdO+SzUgds=; b=vNAjRAoiaev8/Q/FjIkvbyI46M
	mukf9+az1VvXgVtdTFDnGql/Hf+BcW5v8vNjQcbFC5i7TohhsLnoyJR3hDkic8Id+NjLINNunNzd/
	GpZtGJ+Skz0jhFvc7bdLnOBDk8pJASLo+NUTa/IpIWHQw1CAuDHnryamVb3zyu02aEo9vVV5Qn82/
	MJD5fFu3jo9fqFejxBqGxHZ7DQ/JJ8y1lcHzXShcq2vikKrNi9P1dfOswC2Ri6WlhDe8Vv6nK6Uld
	kctbiQiKhILPG0bXgB+YVja/IDcS6lKRgFQ3kiUePskcOhbu5LDj+veo++IdavuFEo7L3oPd/CuIb
	CuNiLsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNumD-00000001mN1-0yx8;
	Sat, 07 Jun 2025 14:44:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNumB-00000001mLg-2VeM
	for ath11k@lists.infradead.org;
	Sat, 07 Jun 2025 14:44:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55759dNg020037
	for <ath11k@lists.infradead.org>; Sat, 7 Jun 2025 14:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A/fuCDH0Gwtq0pcPFkhUBL4eiap0PNxhpbdO+SzUgds=; b=CBeY/1OFaEeoGvIz
	Bf8doQOBi0CJabnMT6X3qnxfHVVvppSXRCO+QW1AI6+3DmEQL2zqRMdWV8lmlcAQ
	H5duShhW86JTR0nO+FMxDTKxTm0p1vo+Nvj4bEi6Lj+cqMp0eSw0+zJcCPsURzLJ
	X33KVd1UYBCCzwawAHLBEo2tUICUh71wIRQurIF5nnRsYeCMkI8dhsP5pIYnHt7i
	suGnSr7cNnJR3fGv130PM6AXOzM8OMQjUobhfewQT5BxKdP0Fboe91CnE93nBzSN
	tE3VwdAlZ/h0LJKum4YgJF/Wq0Ki3N3spmRPP0aHEa3dF/bQ4/t3nr+m5B2hDxj+
	M18Rrg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dt9gp5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 07 Jun 2025 14:44:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311f4f2e761so3236608a91.2
        for <ath11k@lists.infradead.org>; Sat, 07 Jun 2025 07:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307441; x=1749912241;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/fuCDH0Gwtq0pcPFkhUBL4eiap0PNxhpbdO+SzUgds=;
        b=jC5+aeaCegHB3ESyPNn2dcAbyP42N+4V3/TJpIAoconebPpuePBcm7AU9vMo6pZKEc
         6yvNhNbAYDr0kkXBnwIdDz6Qm/BJyAszinh2K4nq9/Hz5gXICn2p3zH2/3X1xDHg4U8k
         evYptgdsvy8Bx6XG+1QHLiFQTwdLpzjAIp1FFeCl/c0d/tB1aXye980xVKmuOK0XyJlr
         Zg4DP5n6ngvzDfnOWkcZyYn0QEZRFn/tDPtrrajKknDfmOFPb7+vmjNldkGaMiSWGeCa
         dxJiP0OMUiiX5J3y86PzWSXNDWU7cO5fHcSiGvDsIjUsc+CBHAo0vhB67xiiwOKTG0x0
         37jw==
X-Forwarded-Encrypted: i=1; AJvYcCWlB2ee4Zv0uCH3LgJDHX2VnQdNi5QbZOI6L7RDGlBUmQurUm/Sni2YJqeBkF8UQ4KVQP7O/fc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz/ifnIhua5ebxw7vyaEMdYe7Xtij//AWDhdR+FnXAHsWQm13b
	TYc7Ya6TntEERMyBIBizQpSemOOXDG18yysthpjW9bbTRWqrX9eJOrTuX0Fa4vY4CBBoUEJNEJc
	YqadWUv5J8ZluJwztyZas4rV6T6iDPcQEIC/RF45Gi4G6V4gvNt5o4cNkcJDU8xr4
X-Gm-Gg: ASbGnctuQiscAUe8yyHnUnLWgoAK4a/CySTKbDYtCa+hrKlEoHLjn7BFDXGueADTA4e
	UT0FX+9nJyWEMU43bux2aWDiPDT5ZasPG3OLfKBFVCepeFY5mGLemSVtFVPfam0tWs3JzlYyZjg
	UkzEZHpocpogZW06k07y/FCL8rdRPlz4ZlFB7gpDliyTKQ5/NvAuT/lj46YDX5Fn2C7lHqSXbc8
	EAel1193YycWaROudmTXQUqfaMcd5S6gvERt2w0UGTFHoNRgrpWTx4rFUpJJRMQEALx3IMXKuuO
	bGPlsHmzltQxWTkM0ZGhN+H1v3cH2znmgsHJP1V69JvDpcMJ
X-Received: by 2002:a17:90b:2d4e:b0:30c:540b:9ba with SMTP id 98e67ed59e1d1-313472e6282mr10368088a91.10.1749307441512;
        Sat, 07 Jun 2025 07:44:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD+4PkLMrBMsDCrQtypCG/jc+LuRnHVZmBtLd1qujgjyESaIf9LewEVCbZGdMu3SiJEsFO3w==
X-Received: by 2002:a17:90b:2d4e:b0:30c:540b:9ba with SMTP id 98e67ed59e1d1-313472e6282mr10368061a91.10.1749307441149;
        Sat, 07 Jun 2025 07:44:01 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:44:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: ~lkcamp/patches@lists.sr.ht, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250522200519.16858-1-rodrigo.gobbi.7@gmail.com>
References: <20250522200519.16858-1-rodrigo.gobbi.7@gmail.com>
Subject: Re: [PATCH ath-next v3] wifi: ath11k: validate ath11k_crypto_mode
 on top of ath11k_core_qmi_firmware_ready
Message-Id: <174930744011.154748.14985794944248434687.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:44:00 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KpNN2XWN c=1 sm=1 tr=0 ts=68445032 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=7IIfrU1qyLA2P-n2L4wA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 23b5jsBEeYrtoD2kAuliX-5UTf1DsuVv
X-Proofpoint-ORIG-GUID: 23b5jsBEeYrtoD2kAuliX-5UTf1DsuVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNSBTYWx0ZWRfXy7v66+SeFnzr
 0GoqfLIVRf48KmWZhmvP2HOYtnlKbfgIH4p9tyZFjsg30d59Qw+sj4piHAqiLiMf1C24TT7iWxw
 86zWbZhuc+fTzmWDWCMkwyqmgGgd5ndrLiB2eM4/NV4/Re1IH7UBYERrKs3N7wNgimcOyOmhmV3
 DXEyozRirkxk9OymLMQSfouZGPftMXHkE7w8JZnExXZKAMoYI1dAafuST4GjPFKn0Nt0jUmO8jM
 25gNp+eDeELhAIKstuyYOhGX4faX1oOhNriEdbkM4stsASU3L1FLMLzyRRos0c2GItgZ1lSSSH0
 gtS7bCWGFdM5qeTdoBh9vK7ExqV5cD5bifiY8CqoZzxBpa1sX4IpFghgxcKYgWktVlRm6HYmVwv
 7NdXsqvyuolx6V+8Npm5TgCzbBLAhtBvmT25MVoci/uOfsuQIq0yWbkvnvuT4GdLiNIkcMpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 mlxlogscore=994 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_074403_771883_7082EFF9 
X-CRM114-Status: UNSURE (   8.30  )
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


On Thu, 22 May 2025 17:01:12 -0300, Rodrigo Gobbi wrote:
> if ath11k_crypto_mode is invalid (not ATH11K_CRYPT_MODE_SW/ATH11K_CRYPT_MODE_HW),
> ath11k_core_qmi_firmware_ready() will not undo some actions that was previously
> started/configured. Do the validation as soon as possible in order to avoid
> undoing actions in that case and also to fix the following smatch warning:
> 
> drivers/net/wireless/ath/ath11k/core.c:2166 ath11k_core_qmi_firmware_ready()
> warn: missing unwind goto?
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: validate ath11k_crypto_mode on top of ath11k_core_qmi_firmware_ready
      commit: b0d226a60856a1b765bb9a3848c7b2322fd08c47

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


