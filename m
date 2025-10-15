Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A31CCD193
	for <ath11k@archiver.kernel.org>; Wed, 15 Oct 2025 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzB5aLxCajfa5GMSNAJ4Eb/AVG7nZr0Yfp5fuGdHQqY=; b=q6WJTcI67w/g7qOuThDTNOHl/P
	LVFjjfHX+/p68AHSWHuPMNVKz+l8UqjLeyLQ5SU0UIi1f/G7eS41xyP2XnK4khKw1WNeIh7bDN4hv
	4I1uUw15HeUwMCjlBv/+iZriI5KC8qXkrOsy6xh0baCk1zkpQOVU+BmxTwFJiyjyOWIb6sF4wDZFb
	HWBLZ8lasoUc0c5VCDln8DB6DR7SYqmaSACnHCVzNK87ALHVnFlwKtelXpSY3coY1VcdqpT0dFUho
	S6GWNkOpc70yO+Wrvz04quhVZjvCfo72f0RdNbri7BWACZNIqZjUfsaGX5ulF81egog4YN5lIS+2y
	02HsKxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6e-000000035hA-02RR;
	Wed, 15 Oct 2025 23:40:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6b-000000035fR-0A9B
	for ath11k@lists.infradead.org;
	Wed, 15 Oct 2025 23:40:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FIJvVu003418
	for <ath11k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DzB5aLxCajfa5GMSNAJ4Eb/AVG7nZr0Yfp5fuGdHQqY=; b=Geb+KiN0HfC4pTZe
	dijQRwAwJVpm03rYgKTG3OSCawsLWkWJQ1UVE1lI5Dx+QQLpql4ZTv0QHaXaGGE6
	UalX7FXNhbhkO5qb3DEMeWPDCQBrL4INRkZg77jeADO+DuHIpFUPPPA8uAtUc8id
	0OKGlvLK/Dp40sycl659edd5fkV/eyVb3ODi5VAQI6kCUivqCleHwlMwwPK/NPa9
	GPKPzk2dg6V3bl0xDd62DUcT10tiGfQO4gIb0QTLoXgWZOi7doYpY3jNxNpU52Z4
	wj6AaYUUGO1es//6spYPixPeoPyhPEfg1AsNaQyBLEyxlN3AORrHSjI6bXZNLz5X
	/QkBtg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8mwm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2909daa65f2so2264225ad.0
        for <ath11k@lists.infradead.org>; Wed, 15 Oct 2025 16:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760571627; x=1761176427;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzB5aLxCajfa5GMSNAJ4Eb/AVG7nZr0Yfp5fuGdHQqY=;
        b=Re6jd8BUVHiVvi76Wsc1HblZ0xYdStf7umx9NLQKYEzEpvtlpOkVRiD/9ONqeJ4vK9
         q7RbOEXIsVZCMym2l28r3BOjH29C+LC7kPy3+H2D6+fM2aLd5jgTzpyVrQahGGGic+4A
         8VZX0F2ew/UF8SOmDD98hvOPKg1DU78MFTUbnWqRe+NXxAS0NsKlLSReZsm4i8eO5j1N
         D894Ox4b/hVtNuQup2XOhT/ScO5eVdSuIbq39pZSZiK6yyCtaR+cbbgG1n7KpO9vXFjv
         wOqbVvYM4RKkQpchegH+LSzpet3Ruz5pBBFTcwhbYKNy8zmFXM4lXMB1A6VLGZCj1Sjj
         K1bg==
X-Forwarded-Encrypted: i=1; AJvYcCVb7fS/gWdqXV3Z+FhRslbOm/MoJH6nRTaoh06sirA/y1gw9ne/+K27dTyo2zUYJ8FAOB2Okqc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwswC2FSr32wyYxqXnNo/PQhZwXyUpCbpDzaFqQGRjHIk/L8JlU
	qk7AxiCiHRQouTLUFcy2cTF6ZUc9fXkFQ5wDBqddoLXb6TdcNLjkwwh744Mq7AGfHgf9R2pga7R
	FTHH9ETWi0TLZ4oKWF6x/6ZJPRuqdNxRb14PmAevTJn2+cpx/mZTxLnJRHwL1dGDYPUyXxhww
X-Gm-Gg: ASbGncumzesJt7VGaDfSMSmFu9yndLHmyhBJfwxFHv8TrqgLxfN2vhlzryfgDYZPifn
	hH5QCrPFyj64xyF+PskQBjhipkkn73BsmL4FJiQ+RSkxOM69WQPm2W1TcGv/r+S23KF46T8CqmU
	uJH/21dIir0LReW5VhOUjIF0LanEcgs7GxSlFkQiC5Rm5TmBNE0nIkgX/iuLnlBe3rgSZNsJRlG
	yUTdnq+l/1m4xbIYc1G0BHVXdFZ2o0Oyda3DW6ck07BchtOk5lwEkW6Uxpj5hPkgFneer/urog8
	PWtnaFb90KPK7unfPrMAUx+1C57ltebpN5xP9Kfvvt8XruiDuCUbYWbzSJCO161YHFmmb5P96l0
	FRZH2SdMnE8EeyS8yc9g9Q5YDIEgw6N+QIXQ=
X-Received: by 2002:a17:902:f54b:b0:24b:1585:6350 with SMTP id d9443c01a7336-29091ae4cd0mr21934235ad.11.1760571626720;
        Wed, 15 Oct 2025 16:40:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGagydBD16UpR7uTmLN/2+yvKL0NUF0tG5fUuFZf+nep1BW3UPO/UuVky60XXWexQq6YEDFCA==
X-Received: by 2002:a17:902:f54b:b0:24b:1585:6350 with SMTP id d9443c01a7336-29091ae4cd0mr21934045ad.11.1760571626263;
        Wed, 15 Oct 2025 16:40:26 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7c255sm8055635ad.70.2025.10.15.16.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 16:40:25 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251010-ath11k-nuke-wmi_bcn_send_from_host_cmd-v1-1-bfb5118d9018@oss.qualcomm.com>
References: <20251010-ath11k-nuke-wmi_bcn_send_from_host_cmd-v1-1-bfb5118d9018@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: Remove struct
 wmi_bcn_send_from_host_cmd
Message-Id: <176057162556.260563.9941291705002350620.b4-ty@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:40:25 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: -lIT8GDIUObsrv93NZn9m0gv4jOjL2N1
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f030ec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=skVgQ6i2UJWBhP5xJtIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfXzxm6lzZXRo8t
 fRbq0UmPHUD5KU5AsHAuWe7nSK6L5OkLylUaUH51WsfwBOOOoiAyk43A+whux91Ux/5fW9YTuZu
 7oxxrYwQh8GsqrBVu8PcU8QAAjcahGEPlSEPeFpkPWy1pjlI2ZKmT6U3l0DaoONd7zPaj7bEKY2
 IqOmkNnVAcG5ivOgw8WpoQe3rn+4rBdp3NQTmTVlahokM4Q+E2+ido3VCQGqySoA/4Ck4yHpciG
 I4DMyZXyqmJNrFMQsgNkDUvKgHhnjwkM1x4SuvaeKnkhDY2FCFT2XnFYXJOiLTxQaVkw7+LgRFS
 rmVSddiKNRVQ4Mpv71iF93rJjPVBDjp4M+HiDCmSMvrX+jp7y1WOuuxXOt/vD43m/Gj/Y7sm+2N
 g4EOVtuI6VF0OHNvpbcTffW7RFSP3g==
X-Proofpoint-ORIG-GUID: -lIT8GDIUObsrv93NZn9m0gv4jOjL2N1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_164029_199018_23E9A4EF 
X-CRM114-Status: UNSURE (   8.15  )
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


On Fri, 10 Oct 2025 09:46:27 -0700, Jeff Johnson wrote:
> struct wmi_bcn_send_from_host_cmd is unused, so remove it.
> 
> Compile tested only.
> 
> 

Applied, thanks!

[1/1] wifi: ath11k: Remove struct wmi_bcn_send_from_host_cmd
      commit: 960fc268a9fc269190014773c81507e695bec3d4

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


