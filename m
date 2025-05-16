Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB5EC54756
	for <ath11k@archiver.kernel.org>; Fri, 16 May 2025 18:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMwJC17N0LZE/PF1Re+m8j8/ER7di5Fs7MKJCmuSolY=; b=xTm/EkTRbCgG/EvtpmVrzq566B
	evudM3PXRvZu2HNOEWu8fOwpinc03VXOfwrRnlkWr4KH9adcS1HtQwb40LGvW9QFTOGKGx8baLJXq
	yF7aOWdtxWGKE/84KYbEziFK/6TNuQN/OngRAMJF2kp9mS1aVvZSV6kDSKz6Td1dsSj64cjR0tV2G
	WjmgfbDvAjGYh/PTg8KFvp43oYQHOdcdw+2wtUuRZgcP/8oBkYCpxVN0MbEwNQ/u0FsYGrrpmUBRS
	Cgww52ZRxC37QCC9wxvVysTpa9fCrMJBZzns5q8MV3yTexW9+3vGCTtbn5w0yY9Yt8wq2a/ux/JgO
	DkrDNHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG01u-00000004MLY-1sBM;
	Fri, 16 May 2025 18:43:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzsj-00000004Kv7-2lnI
	for ath11k@lists.infradead.org;
	Fri, 16 May 2025 18:34:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBU9Ix026254
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 18:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMwJC17N0LZE/PF1Re+m8j8/ER7di5Fs7MKJCmuSolY=; b=C1RRrQjRL8kVmzyP
	LZlAkZBgprpLpZBM4LpXi1qGUPvJwia+ag+l4xyW3Eu9mfSc2NaiTQcl0cxwcP6W
	g74hyL+S+VS4ijJsngIh+2JGVP+yNwRqtmItbP42pkdNIPrOcfqW5YwIkSWdfG10
	6oU9TqL+HIFaD0U70Z26kPulz60Cj9LNad1cISjKRb9Ty6jSDnlhXs+gbSzpchUV
	y8QWiqR/Y/2Vbh4rNG3obH4fRNhf6ZhGDG8CJSecruAz5ukjI+7nsoVZ0MYIf6/R
	9cf/oJ8Hh9cWMl+47vF2kYRhZ/WSedt0QUYCEwn8MvZg/iZDOuwgdXINg/KWfKb6
	8/B6HA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyu3m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 18:34:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso1536724a12.0
        for <ath11k@lists.infradead.org>; Fri, 16 May 2025 11:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747420444; x=1748025244;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMwJC17N0LZE/PF1Re+m8j8/ER7di5Fs7MKJCmuSolY=;
        b=jEVbHMZ5Yb1kOIQ4OwR3qDpRBvMdod1p7Uw21j65Op+Abnz+rmEkv/ncjegPfdGMt1
         l+jaV23T506oTl75/dLcHNfThddE3SXYGg+THgysg5CTOjf8Q2MPszhuq71J1BXerupX
         AC+yYBWSIxSAvf564c0qZQXntwjuB3X57b+wVKbsl1W0Z2Cks49VjuUAD9jJaPSwk0Vu
         pdB58LinQdKu66+yDmJE99U+4NvkTprNo+Vo0+mFUXRiN/qh/Of7J43ozSBU+qBvW/ek
         LAHtVSuXOB0pYhPG5TDUM6ixnm10dQIepjwogr9yO98gBJ1OStuEvyq9/XtEwhR9J4z6
         +FVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWySTpQuf1RHAcT09PVo6XtAcozbLoOByqsTtUX+txsC/bntvb6p9L39axLLFgijCVuv2U9kxo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzO2BaWnt+bsae0NfVJpgmK6LV5UoRHqguCEmso2cSKvqxIswbr
	OGMTjAEyLTwZSLcrsAr3rODgIhFv1R8U/7Q9KZYDdq2YnRm5szSgUezva49e75cw8wURGEhhK5K
	NRkLayu5ERoNUwKQbvWBmJiG9EIoVltqK3oVCg61t/vX84uFY3Yzde4r056DWmXww
X-Gm-Gg: ASbGncu3vrLCMjaE5oYFVWxsyiiLwJiAV4ocI14rH9ExbqxmDrUdhq9uVKWPyKtEuIW
	mild4fyIYi3kp+7ysVi9mKwjB+gtEXaRiyw38BFoo9dEolghVs3rYpeZ+X1AMrbmMd/wDvENlxh
	6SPuaiZy3RomGH0PJhfu+Q1P63Qj+d5guWY56j136dKnFCK6bCEBrujM0lVB5liaGM4jbWBY6Iv
	4ELf/HopMpwWzAArsMKhkWygB3bUhORwaXA8+PjbO18XYjDDBzfcyktV6/gQcQKRHdmasqNtoix
	HVOQUJ6EREfj/rpDyq4fCrOWJaVIKBR3L9xhS7zUcNdGCzcy
X-Received: by 2002:a17:90a:e28e:b0:30e:823f:ef2d with SMTP id 98e67ed59e1d1-30e83216f6emr3390122a91.22.1747420444342;
        Fri, 16 May 2025 11:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKrnTa0VFLRTEBZCfV/Z7H4WzAhUIJOQQAV7WI7LhPnP/umk4KgcKmhJ1vHpXH01VjBGHX2w==
X-Received: by 2002:a17:90a:e28e:b0:30e:823f:ef2d with SMTP id 98e67ed59e1d1-30e83216f6emr3390085a91.22.1747420443852;
        Fri, 16 May 2025 11:34:03 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d576babsm1886299a91.33.2025.05.16.11.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 11:34:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>,
        Clayton Craft <clayton@craftyguy.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
In-Reply-To: <20250321145302.4775-1-johan+linaro@kernel.org>
References: <20250321145302.4775-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix rx completion meta data corruption
Message-Id: <174742044217.3092151.7410193996690738196.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:34:02 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: UL0k-NmvaHGxQ_e1QEG6Xp44Zd-bChD1
X-Proofpoint-ORIG-GUID: UL0k-NmvaHGxQ_e1QEG6Xp44Zd-bChD1
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6827851d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4MiBTYWx0ZWRfX7XE6Z0qjE8x4
 n0++iQ9AA60rwfj+q2mXITHYRg+brtAVC3to5AE75RQxfPjqJnezctTI4x4AYfhULsPkRKUtyO3
 i8of+WO8B2TKI4roN4UNlVkyz6mFDyguP/Ku8I4SkbvXUjrhUPAbz/JMs3/sJpxvlek5rwXvthy
 AUvpyCtDpfEF4UL2GvjpZBp8meZRHZcRkkvr8FKB6fqZTKexsJ+wgbFlh58zSXXEOUXPG0AGErS
 vCyTj0MW55jNSpMUpPWNuLCUfe9e72V3NjmHRJbLeJCf90+fXICXqY86IS+jzV9TtZJvJKvHycU
 5rs+MgtmGWhAYR5s1ywTux8pVPFnUDZ6UBjHmIAWEAyj4QCs+kqKkx3M8u4NqCbuxo03Q5+Kaw5
 jmpdIr+cJScVrjNgTKunbhXoKo9H04FhzDxZX7Y4EQnAkVJ33Kh0hNrYYWdlCQrTSHTv6ENV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=974 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_113405_716130_90E70639 
X-CRM114-Status: UNSURE (   9.06  )
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


On Fri, 21 Mar 2025 15:53:02 +0100, Johan Hovold wrote:
> Add the missing memory barrier to make sure that the REO dest ring
> descriptor is read after the head pointer to avoid using stale data on
> weakly ordered architectures like aarch64.
> 
> This may fix the ring-buffer corruption worked around by commit
> f9fff67d2d7c ("wifi: ath11k: Fix SKB corruption in REO destination
> ring") by silently discarding data, and may possibly also address user
> reported errors like:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix rx completion meta data corruption
      commit: ab52e3e44fe9b666281752e2481d11e25b0e3fdd

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


