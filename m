Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A896D4A5E2
	for <ath11k@archiver.kernel.org>; Fri, 16 Jan 2026 01:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjdVPJuaJGcqmM8YwD5XEL9JXuE48op3hE1XiLG5Jqw=; b=g/LDgkjaZ/EKw94C7o3Mgo3sZE
	STCOSm2UpyvQDWNLIKVxoeNnrSCploJDBUOrvD/K/NB17stSBn2UBTeRQu/Sk+ycSimgKsNNg1yVQ
	Zi32IF0Gjkx91tLGveKkuGXO1JhrYroUKX25i9SPF+qKLERi7rkWTiBWn7CZmLNymbienSwOhZah8
	n3NUd3G6PH4Tm9DaVi2KMPRiyP37POSrmrEDmr+4jPEYWwA5bzeOEHL9j8Rc5W+xzxwPwnFjNl5gl
	Os4ncx/2HgFT501uEWPnsl7iFmY2ZnaJJI07aDzo8iVNqRCQotCz798kAg6k97CMHlYT1e6y0zVj4
	0LGnVkNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcN-0000000DQ8X-0CEG;
	Fri, 16 Jan 2026 01:27:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYc4-0000000DQ0L-1O2X
	for ath11k@lists.infradead.org;
	Fri, 16 Jan 2026 01:27:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMaNUx3192258
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mjdVPJuaJGcqmM8YwD5XEL9JXuE48op3hE1XiLG5Jqw=; b=aBdaibP/+zzQCVZs
	od1PsCLsvnGT0Lrw7avsj/rBvEzgNH5TVcSbnT1mue5LcfmexcGR1b+cYKcsmhZa
	Y9pWm1OTQLuxivPA9ti5B98asUzM3Y72LyR0x6gcy2yaynGbWX/Jjms62lmNB/jt
	oJv+IaRmTb8yzfA8JicsuxGZIEAQ7bOgPCPChu2qph3mnLhYWmZhrbRmic0VSCVM
	yiFFXzPARX660zWi5vpg01x0qWRPx1ojpgZ3s5/O4aqFM6+iNUo0hihYbck9JHc/
	D6NLaysEFlYYw8GJZgmpq5da5Ho4Myf6AG/uW6gYTcZtKS42834BDZrIvkE1sFn+
	kAZ+6w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968gbw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b6b56e2b07so1803271eec.1
        for <ath11k@lists.infradead.org>; Thu, 15 Jan 2026 17:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768526815; x=1769131615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjdVPJuaJGcqmM8YwD5XEL9JXuE48op3hE1XiLG5Jqw=;
        b=P3Ybck6wMNGxPtIqqWOukxYoNXutckzybe1IepZGWJBXX88NTjyZ9NQPAH/6f0pIvY
         V6F08yoyCvLZby1GD/tPiB3hd0hKvtDc7HOQKsXsZ+4c44mF2KVdiPDZfTBf99pUI4+L
         YZwHv9EvGEp8Bw5a5ZAu0z2eC8jo1AYPWb0zAgnUmM7uoxk941OGVFSeZmFd5INPt2Pa
         26gbD2Syrq75spqgvoLXKgq7ylfbHKkOeNVgfd1QgTCqMYF9EKO12gUSyUnoVSTyMfb4
         PaVvy325W8Yh08RH9hwd4kfIxpujTJvkTAir6CiwUMC4gYqT8dC25FGGilM4jY/9q9J0
         bmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526815; x=1769131615;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mjdVPJuaJGcqmM8YwD5XEL9JXuE48op3hE1XiLG5Jqw=;
        b=idUdugdVA/aS/MNJa4oyLW9/SiNZAIGbjPpV/fEwvsC2xBF8DeI1dBvuF4ROJ1a9X9
         4xvPCu5j78WdmgysekfiRE+Cs7sh4poBNpXMJ69rJXeOFYo6Xvvt/CAC+fCRin9/eoik
         I8IwMLMLqWgm5/DiwA2BRXVdAnE9z9BignsfYfoPJ+DON0SQ6dHxp+RwZX4LegxNo7et
         dWGQrxZ62Iqx24uGgo8VoYPwYNdrQPNnBurY3NNY4KdB25dcfrC5Az/yfCC0CxmvmEuP
         ishjB9QeUs1EFe9YVvVDH5QQ2GpFN+P4VXMHoms1bJzZcUj4oUdaoT8j9Z90vGgDOc4j
         du1g==
X-Forwarded-Encrypted: i=1; AJvYcCXMzlksjI8asHVbVaOjfy4YuTVgsxLruzbtsraTiIIahAiBb42OlmdJyoznkLY5deDCmR6sNi0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo9SzMfIsBbkVumkArFJfHZs7v4JVU1br9VzWfspOCkfXGzs0f
	9ZqN3OtFbI4TSgoPmtOdXggLVPTDBip5wiRDFuoh6XVxzwgkytfUe+Q+TPMAqeZIjE8ySFDpD9A
	DT7TTQfJiyZehOeAhPVPozZlRxHEEX5dr/d9dO5kCeIe3kPzxRUBqhCkwjvk210VX
X-Gm-Gg: AY/fxX6gSyq1lfSZ9bPen4/iKFoWgywgCuJN0pdclx/fkTbhwPHywLR6fePgE0bExbi
	lwqEFfcqhIcg1NlWdDLCTN8yYKuhNwLfaypRxzwUZSzq6vRmVjUI4pC+Qfte+dWhod4ev24z+d3
	DqYAhU5oDchhAxssYm0FDXbwp007EUTGc9IsCtsDEwzmD9a3+B+98Rnvo+wVCVJWMjqd26S9+Cg
	9N9pSN5B0uySvK+9+Hqwc6k0EBaNh2tcWOA15jQtOR9Sh9JHon5B93go98b++1K1yHR8t2OfHQR
	HN49r75p82xkA/YC8jv7gbaYY/oNSUXY7aLv1BOcUTmGM9a5KCiPpT3XVjIpbU7j2r2D7tEwRTS
	Gp0J9BtwNT/E48SimFwew0EC47YAKbk+iICgH1FYzhYw8g+Wo4MnUna3ZF9kIQlAZ
X-Received: by 2002:a05:7301:678e:b0:2a4:3593:968d with SMTP id 5a478bee46e88-2b6b3f2ee49mr921374eec.10.1768526814708;
        Thu, 15 Jan 2026 17:26:54 -0800 (PST)
X-Received: by 2002:a05:7301:678e:b0:2a4:3593:968d with SMTP id 5a478bee46e88-2b6b3f2ee49mr921354eec.10.1768526813646;
        Thu, 15 Jan 2026 17:26:53 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm884104eec.9.2026.01.15.17.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:26:53 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, ath11k@lists.infradead.org,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: baochen.qiang@oss.qualcomm.com, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251228151408.2116108-1-mr.nuke.me@gmail.com>
References: <20251228151408.2116108-1-mr.nuke.me@gmail.com>
Subject: Re: [PATCH v3] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
Message-Id: <176852681315.1143034.3902851959710218802.b4-ty@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 17:26:53 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=696993df cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uJMSx7lhC2BmJES397YA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: kdY5sfQkL5ZbCRUMepKgQITjTC7xwipC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAxMCBTYWx0ZWRfX1OjA2ON38iXy
 0NypYveoceBTLQHaxrWx9dJtI0klwaHQ02B4UyajNjDpvOHdCtjQDuR36lx2VcTK0OrDJxNgnut
 GwZn5zwMjbGKF/iA3YSNA1Cy9yU5xXVjCKgv1cZU1/yFrDG0t7pnEUTs4xds/n5R0sCKRED94Xi
 0rgdsfMgqpZUF8HkhfLvLuO8/aixYDXcPy37XA2nEPP9PeWk+gIbSKyf8u2we18fNEOMPsIZ0Nz
 p4vLsn73QhpfucEVnbX8t+CoDS+IcKuAZe9PfXQVoqzwsGiofaqQXGCv3DybJfzb7NQSBJ/kMsf
 nfas4tM0gDLOJizgMRrcRUOYSe0kehPfkc1LjcZKN49k+vsZBU3aqA2+0nt/VZUypzrma0byLrr
 5VrLFjP3zvqQ6pt7WvaiufYGMrzo/fIPwwl2us33ASdnFIMy6+Xq3KedG4CCcRpITB+RVwMif2M
 lzuyT27dhiYvpSgBjEA==
X-Proofpoint-GUID: kdY5sfQkL5ZbCRUMepKgQITjTC7xwipC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_172656_374721_DB44A862 
X-CRM114-Status: UNSURE (   9.75  )
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


On Sun, 28 Dec 2025 09:14:05 -0600, Alexandru Gagniuc wrote:
> ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
> is initialized in, core.c, a different file than the array. This
> spaghetti-like relation is fragile and not obvious. Accidentally
> setting ".max_tx_ring" too high leads to a hard to track out-of-
> bounds access and memory corruption.
> 
> There is a small ambiguity on the meaning of "max_tx_ring":
>  - The highest ring, max=3 implies there are 4 rings (0, 1, 2, 3)
>  - The highest number to use for array indexing (there are 3 rings)
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: move .max_tx_ring to struct ath11k_hw_hal_params
      commit: b515730ec3d231aa36b6177524532fc7d94f1750

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


