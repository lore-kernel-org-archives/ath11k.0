Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2B3C3DA6D
	for <ath11k@archiver.kernel.org>; Fri, 16 May 2025 21:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvexSBQf9AqvTEL0MQV2xVh+Hjlmn9UIZPmY5emHet0=; b=44u9FCP+S2Zv5JROcVK4zGzwQE
	Lqy0Cmoi45ypRsssAYvisOBzYio2axr5ahDP9I52Babrwp4L6TA84Iw21csp+ip6n3ovEr0O5NJpG
	LxJEZPoh0dMbzfymXYHIUy3y/AaAyhVtD9tc5oU2R+r4gekRNc/0sqAtMS/GuE4F2KDLemflnlXhv
	HIUP0CJ+58QhzRffoVgmYUMhXXz4ZhOtq6m6BUA4hMmmYDgR9TKitCz+QmusPBydWRDUBnVN779Vn
	6+mTuq5NxMIhunDzsbGctQHptQDTCBOKqn0Vi/ii1B0Lsf5kn62D3ERsywSWDgw7msFRG+kR8fmcO
	/eX+7RDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG2qp-00000004gPl-2Pvq;
	Fri, 16 May 2025 21:44:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG2jm-00000004fBr-0XDi
	for ath11k@lists.infradead.org;
	Fri, 16 May 2025 21:37:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBRxh9023734
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 21:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZvexSBQf9AqvTEL0MQV2xVh+Hjlmn9UIZPmY5emHet0=; b=llwuOhifEInXFWey
	kuJmN4LfIjKr9jymAX1ilEN2hSQS2keCYjIK+Iqpfs/ZTa36M1ehmzWagZ6gHlHN
	4a8D3J1jVJk1veZQxLw7gBzSWmcaIVd/7eIxenS5qSugRjL/n4Swr/rjCl1hn6SF
	2CO/DEzcgo27vAs0wpdjIoCBSWEm9ndPJ6GmFXmagOo6sz3aWZgVzGq8RRczNvHC
	R5qpYWZK1bjIKJe8r8R87T82LkpoqEfxsBIRhSQSSP6GHqepfr538+JCDN3ViIzm
	bOCxpdgZSlRbryu6IKmR2ZSUAT0C0ygsc7mI2pNwq+474GZlrM26HE32gR3b3PUj
	aROMiQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p4gq9gfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 21:37:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30c50f130d9so2246754a91.1
        for <ath11k@lists.infradead.org>; Fri, 16 May 2025 14:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747431419; x=1748036219;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvexSBQf9AqvTEL0MQV2xVh+Hjlmn9UIZPmY5emHet0=;
        b=nCLh0mBxdyF/VMzgIsWnfu5iHEeiWcDGtFvl/jH0WLvEgGN/bm2huGyoP8jz1IWYSi
         7+iWNqzN2ckapabHgsyAOdxIPeC7G2L7WdcvBI3Kvj2x7fLeL7mW/zJXR48zc9rslxyl
         QTmw+Z9ePzf8y6iM7xaaa+bxgInnx5Oy/EpNmS8vm+CLbgJtOHmlx9Hvieu+3LlC+vob
         Q6UBWO5znuRDV5GdbWV7L/4Rk8Kum2q+43MB9nobhRxq6cSLIJ2+Oo9mU5BfeVyHZtw6
         HUO1BCtqu2gie0pusgyDTc9rExcyd+idUUmyNBq1jgm/Vibb7kGtkSXyFo26L+C5tK8P
         75sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCKtazyn5r6mqEBmMr9kHbJgnT1ZqSgCaKtK2IswiFyK/mPclXJDMDWeQgWx5UzS9S9rug1PI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAKZP/aXzUAVHJ0Qbq93Xi4ybLQADgaBQ48ueRsmtp/RGN5vuQ
	qoqV9iQ+Nv6BXf3ZNwwtSrhJm4CK3DnJpDQyco+Lujwfk/a0NBVIQ6jndQyNrvnG3ymQB34OYXh
	4xVad33VTUgybFKXrqtUOwyaGdGXkd70/Ijk0DrTQ5sWiN+qOaRD1DtObZq1rbyqs
X-Gm-Gg: ASbGncsZalnqJf0Ro9jPtSWwkRwxkF6zqCTVTbwkcAJs1NSEqEu2AVOiE1/RrFVGVK+
	E5EdgSN0VfPFgOskmi7np6nspw5Xj5r/iV1LE+CdM/VXYxLpqiqLM7S8lluGlyicuj/xJsFheYq
	Ji+b6lWVCv6kzzKIc8l6yie2SzFfXl0VLe1Y2v0Mlyxmky0MbGzLCi6svqzZYYyghH62qSrrQAW
	/JcvgBs1FfsRVolsHk3n5CxB2vJGgKtG018FwQPqXy3iNLixjZcHw7tIoHhec+ch03082XYiQaa
	PfiL2a9WulBXYs4CUCL1yHMaSAynI5HQSf+89vExJAC/PLuT
X-Received: by 2002:a17:90b:3b8f:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30e830ebf2cmr6020187a91.13.1747431419366;
        Fri, 16 May 2025 14:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4iAEj2lGvHPTdxtDA1MTNbRsd2iYilUgI8JO1IutY2WKZ40LXK71qBKF63X0diDwgdPQNFQ==
X-Received: by 2002:a17:90b:3b8f:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30e830ebf2cmr6020160a91.13.1747431418987;
        Fri, 16 May 2025 14:36:58 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33435b25sm5658010a91.17.2025.05.16.14.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 14:36:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
References: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
Subject: Re: (subset) [PATCH wireless-next v5 0/3] wifi: MBSSID support in
 MLO
Message-Id: <174743141835.3870542.2654124463344102892.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 14:36:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: 8pWLAlIFMThlron_HgsHjTR9Q0_jA3Nk
X-Authority-Analysis: v=2.4 cv=KulN2XWN c=1 sm=1 tr=0 ts=6827affc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=aA1yfRMYb10aeN-VgkwA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxMiBTYWx0ZWRfX5wA9XDD57SHo
 VxY6aCNITpBIIy+hVIF8TS9rjCZeDJ04ICjBd/Hg2JlVIGw5iFqlGyepVK9zoOhgMQnC+0yCR+m
 GORIObh1umcBbuXoIlF2lacfdRCpWF3SwDe2CR1I8GTR+IcOazat+8kNX2xPGlgbl91DTjmQ6fD
 4r1oGrFTnVbQJTHcVTzpau+8y9qoo026+h5d7wMoxgzDosQAcwD2G2xwAzJcMzG4jlLQ0Str+iy
 mICUfcd25z17P9GUYYNvasNHa0MyPZd9LOqtfDYBF7U/cGYjAd/ICV9vPgRyZe/M+3J7U1gmWcG
 RnmfHzw2UguYz/Qy5Xm4ldZ2iGO2DvmrB1KS4cAyREc9LpR5IsZ6uKFuS9wI8t0MPNkACYAfMnH
 1ArYaamH7Tlc8Wj55ui1+0tVLFk3VPtt8NoYoGBnzi/1nmN7Ugoev1JwBP0GcIuqiyVq8DtZ
X-Proofpoint-GUID: 8pWLAlIFMThlron_HgsHjTR9Q0_jA3Nk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=975 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_143702_194905_83168E5C 
X-CRM114-Status: UNSURE (   9.70  )
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


On Tue, 08 Apr 2025 11:44:58 -0700, Aloka Dixit wrote:
> During non-transmitted (nontx) profile configuration, interface
> index of the transmitted (tx) profile is used to retrieve the
> wireless device (wdev) associated with it. With MLO, this 'wdev'
> may be part of an MLD with more than one link, hence only
> interface index is not sufficient anymore to retrieve the correct
> tx profile. Add a new attribute to configure link id of tx profile.
> 
> [...]

Applied, thanks!

[3/3] wifi: ath12k: pass link_conf for tx_arvif retrieval
      commit: 172e1570e1d31260f11f43e828d98aff020726a8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


