Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4726BCCD1BC
	for <ath11k@archiver.kernel.org>; Thu, 23 Oct 2025 17:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRq1ugaT90FNBOZl/OCD7yyFwBcTZ9ecupEzJ/5yXAA=; b=zxZnf6OVR8ERolSCEWlwUBQrbO
	fQLqmK0MN/Jl/1WoF9IB4XoLUW92otHKQymN8COg1uJMkYxFRhe+851ntV7Yx2PG8cKXiMiACWfCM
	pN8cGtlAeJSeMeoyzJkEN6KZO3sVmSDGgFsPENwWZMQFz8vL21AipKxizzY1H/vESgxVB5kkP7AnA
	dRusWHMJSr3j3bvo2263RREOd+rHWVg/CBJ5E6rNY37KqMtnwGGgUW9nfvRbEpF6drOMzXDlV+4n5
	8PAZ0mtAoNWFLlQOMItYFR94BtbNEpwQlJIMGV5PBzV58Cg8hCVzo92urE5BbUK2StGv8PtQbKyE4
	2Xj/OM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzDM-000000075FI-1rPZ;
	Thu, 23 Oct 2025 17:35:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzDK-000000075Ea-3WzI
	for ath11k@bombadil.infradead.org;
	Thu, 23 Oct 2025 17:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GRq1ugaT90FNBOZl/OCD7yyFwBcTZ9ecupEzJ/5yXAA=; b=kWzsPvJa5IROPWTd2xtR7anjYd
	ssBXRoCqh7ENNRTUYydCfBjdrcOsKt/sl5ifecZF7WXG4RnClafEOYWweAOdDK+vkrRkuuUP3qah/
	rrXPcSGoz3bEqnrjRv9XM2komhiKwiRC9KZmOCQq5m/SeGRpvMYVxr5gnYnHN1GH1xOFEneSLteMS
	zeMGJ5kNZ/pJYBAd+Y9OEuc6RBGkYLxu/Pr/BH5TFkJeBWzQJ/fIbVbccQ8k7UnfZxB7mg+cEttDG
	foGoKS2SgpWljKM06NHSIKxOYiI/OVEccrE25iZLg+UZBPpT7K0eTT3o7q+dwqRho2AddKKB+xzPX
	d+2hRlEg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByLc-00000001Y9Z-3EeT
	for ath11k@lists.infradead.org;
	Thu, 23 Oct 2025 16:39:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEuJ63027193
	for <ath11k@lists.infradead.org>; Thu, 23 Oct 2025 17:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRq1ugaT90FNBOZl/OCD7yyFwBcTZ9ecupEzJ/5yXAA=; b=F1MerIhRYX/nFUpP
	bhHAettHN6rjCJZejqzrgRdMSpzWKNJv7tiGIep2Oi11MiDOuD580WapfD/Qjxfa
	7rbcRz0eUHXBFYy2bc2ADFp1jh7XKQYkRPtyPsJzDnvdM75DPi37Bq4/sokQE4WA
	tPF+z6J6fHaGz53YwK0HEt+/Ctu1lilw4HMm7rE33CjkTn4VqYJ4XQqZNcaTRxcq
	Z54D8XUQv3amWhOvlcvwbPgtC9RfpiR6gQc3CRWMreLCmjBZpeLYeM+oxs/KbkgU
	VuP5uX++EA4S7CXXN2dRnAzGY2PoCJSEP0JMXelFuF5LNNFyLL7Q6uwCVKXhk7fp
	mucTYQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8kgdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 23 Oct 2025 17:34:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2924b3b9d47so10732255ad.0
        for <ath11k@lists.infradead.org>; Thu, 23 Oct 2025 10:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761240896; x=1761845696;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRq1ugaT90FNBOZl/OCD7yyFwBcTZ9ecupEzJ/5yXAA=;
        b=fgPnRRXyjoI2vdOPOf1GPDoLE9Ucw3kSmhIKNJWJABI8jVKakY4yLTj6dZFVqJfBEZ
         wmNwPjGTSOwp9tRxIR/lSWyViCCB3EBEhry0b0x2wkkGj6yefQXDcvSxJylbTJzhjqIn
         +9f5Twt9d+UjFq6BI6JhNAqF7/E9yXIGZazLH/iEXoLDAa5mTjX/TU+Yj2jjHyLdXtr7
         kjq+k00mJdNJduYAd1wlMVMdgPPfcaEfERPqM8V9e3yaobOQ3mTtUNFwKVraa90w+e5r
         QXgDE2ObkICFLl/Rc9X1oz9MmUak8NhNLlxXAiYsciEqnfIo0T6VpPNUXNgMDlEmDrVv
         x/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVc4TMijgSMJ+4qpXMcXk/DvVgNwGlzGPNL9CKiOLasResRmBk3FSFBBcKTR48pXASJyPk2ZpQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr+7fv91qMYZWlDsfuc7npQXoyh3Z5l6headq6tx1txG8j+mxo
	iU6I/p48D/c+tT0bIhMc0pG9t4yAAd6F83fNyM0rCv72nEHmKXo+qQl2DBzJJmhBut2W4HU14S4
	iE7KjS3vN3HPdgcgnkIBz/kcZmL17gV0PQly/iFz79FHDjurP8Tpj+b2V5JSrdt3V
X-Gm-Gg: ASbGncvbFGCg8q8p9xe+Rt/wjhgmaIWC8I43aUAnLwghvx9+89Di6Vc25s2m2c4C9QO
	KTDKgVvIlNUnBaSVhJMHgboe9BpSFfKbaSf1ZvzddgWJJSqcdvk6tptDgeLn+33Rx8jcxxW2ko0
	QOzgH7Vn4oeCW6nS6HkUhhLJJPu1kVTxwsxx453Ll4s0PMzEfw0cimaixQspcTx+i0l4bZCkWN3
	RKeH00PNBFNwFG0cMpDeUh3uzsMeeIYGZzPY7UyhC3R5us9TpePEJiMrAdcDtT+v6k4aNabtX9/
	Tge71eiwB5+BnyP9Pi5NlVwo8biGzg/zkyHUJyCVngRWSb536N9jienVo6GXioPW8m26fnWBBnH
	FnP20cXXnHGuZupWiq5O6uB76wTIH5sgf0XA=
X-Received: by 2002:a17:902:f605:b0:24c:b39f:baaa with SMTP id d9443c01a7336-290cb183b74mr328998465ad.49.1761240895802;
        Thu, 23 Oct 2025 10:34:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe1gNXGtcwmAY4vl7c21IrIBT/QHrguMJXJlGUhi5RMDu1zGJDn3KX9oBfiWJOjRr5Q+ZP2Q==
X-Received: by 2002:a17:902:f605:b0:24c:b39f:baaa with SMTP id d9443c01a7336-290cb183b74mr328998165ad.49.1761240895162;
        Thu, 23 Oct 2025 10:34:55 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e158fdsm2631407a12.19.2025.10.23.10.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:34:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251022-ath11k-bad-macro-arg-v1-1-93a8eadb6191@oss.qualcomm.com>
References: <20251022-ath11k-bad-macro-arg-v1-1-93a8eadb6191@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: Correctly use "ab" macro
 parameter
Message-Id: <176124089446.3626081.12835571659447806961.b4-ty@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:34:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: t9l1mF0F3oUUyjjvNWyoOrALzP7a2GSR
X-Proofpoint-GUID: t9l1mF0F3oUUyjjvNWyoOrALzP7a2GSR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX/OZ5f+EH0dFG
 hhT66XeUaNoKskusP+MX7gMz5i3EfHBPMNEO2b9NuKukXXDc/dEG8NeLqbIIL8odm/WvHBkx30P
 1QgEgUyXpb6nVcbiHnFCfzwwyBXjCHPxYX4Qj0TfiiM7RRhvY3P9PIKzHYsN7YXZiGTqwhpuJsp
 u8n9z6NtasncFkFtBGYRodErioNnR+NrAF+FJm2NDsuIQb2UvFr8MJ7R1+7jL/9YgJ3i/1FUQmV
 LGbQiSqD+J+GTxxHPt3vBBHEnOzXDQvjaWKhqDJ5MkJiJIg3YJD2VmsRtaIswtRHAU3F3tZuHZp
 OF167Q0WmCEqG8MeGcI/dfexFqKXh2FJtgg8ps4sm3rz4Tc4FmwHeZ1On6vrlawBdAWRf2r64NX
 pOAJ3L27B561yxYjg4TkdhAZrBROog==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fa6741 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6fyoW-0bdveP3ZPMVTgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_173933_227094_15CCB73F 
X-CRM114-Status: UNSURE (   9.41  )
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


On Wed, 22 Oct 2025 08:24:46 -0700, Jeff Johnson wrote:
> The checkpatch script is reporting multiple instances of:
> 	Argument 'x' is not used in function-like macro
> 
> Fix these by renaming the argument to match the usage. In the process,
> also add parenthesis to the usage to avoid MACRO_ARG_PRECEDENCE
> issues.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Correctly use "ab" macro parameter
      commit: 50cb7ccab8176cbce4e32420f9fc2d6d80e69a09

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


