Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA08CD4F4A
	for <ath11k@archiver.kernel.org>; Mon, 18 May 2026 13:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adEAsg2ZzgM40o8WGasVv3IMJk1fWqgZiZUjX8Vrrs4=; b=B1NbkU5AerU+icADX0C0VVHS96
	0rJsZDTORge5QtPIyZ3+g8NggMlI3s+vKuYys457kdyKhEJGFx4FhJnebjQl8vLqMca7CC+7GaMjj
	KX2oqEdI1d1x2giTLn/8juw4+oiDzxryjmubUlWh73JLJ5SzLtFYWEXZv5s6IKrKBoZTqhkB7wOmV
	eseEVrKBg1T+fBQ/xvcgBukjEwMAB0bh7nHSX6UhcuZysNu2KPzpm+Rd46b1IF0Nwmo9MLBf+13uP
	eyERDzYfmcc9P13YsXs/tGcLRyZeUGMScXK+P3IzNpy3qlwMjZjIEwXAqEqRPZpWHX11Y+JBlBtug
	f5HctcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyQG-0000000Fsvj-0xll;
	Mon, 18 May 2026 13:54:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyQA-0000000Fss9-3Zdg
	for ath11k@lists.infradead.org;
	Mon, 18 May 2026 13:54:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAliqo2685229
	for <ath11k@lists.infradead.org>; Mon, 18 May 2026 13:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adEAsg2ZzgM40o8WGasVv3IMJk1fWqgZiZUjX8Vrrs4=; b=XasWpou05i24BOWs
	1W17tSfaJcBGzNa59WjRxR7P/jAJdwa1ZKiR39Z1XeXVRbUTy9Cm01TTMpYe+GJc
	j5vjdFG4xMCkFxeZStL/FSNEW25rsrBGg2K5iZdtNXbp74Y3K3SuKZ/yqRg1ZOon
	dQzABuSWTEmB7s8gSYt5fjrXjCk5AoLeHNz94f57pgoUX6Q4Lk9pQMfarS3wGuoH
	We/CqcoGboV2gY2Pb+MOk0ci1AF50nS/SxUZCkWZTSVBG0M/cMptlG5FFiE/R+89
	aGt6eknLArjbNzOUoFnYEhWuCtO5RKYOLu8j+9CHzrStYtGwG6O0/mOxEBT3morU
	/5eaFw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vrbt2bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 18 May 2026 13:54:13 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1329791f18fso3908003c88.1
        for <ath11k@lists.infradead.org>; Mon, 18 May 2026 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112453; x=1779717253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adEAsg2ZzgM40o8WGasVv3IMJk1fWqgZiZUjX8Vrrs4=;
        b=edtmNuEs21/GA5UR8Npyx5qVDf8xFUvMLi4ow3hVxCxWVzeDKoXndqDlsu+qSlrU+D
         a/i/6OhNBCcJ8y6/Jy6pugfpY+jaaOX7s+5+m4UieDT6sYU3kWI047fOKWjwHQoE77hc
         b9u87eyOwEgn1qfxckf5/WYMYqiy6fJ3RkQAVFtiMNZkdNBSNSaV/MuVoQUgaola+qh4
         uKt3CPM0ezE3hXVLwLuIt8+2hhAuv8mlkAiAI3FmlYxdaZSTwG6qxWxBoOPNjvO6mwLA
         UI/sq5izEzvkkUp0dR1cttgl4S8sZYIdvlo1tawMClozduN/HrEaDyksekCOpk5QfbNt
         Qp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112453; x=1779717253;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=adEAsg2ZzgM40o8WGasVv3IMJk1fWqgZiZUjX8Vrrs4=;
        b=QWvc4QMUYFFmXu7OadbVUN5qMkw19509psSTwOx7cPHAtEJ1peLPDBilV5DWiid0KI
         B2rFZlkMMXddWruOz0ATKbUKTjnQxw2/LvcYLPhQ7m68NdOiB8qdJsh5v58q2VjnAVr3
         v8mfHRSe+jMEmK+EjbHLWijrWj4TV40kr+3pA+n2D7pQfrwaMaCn46mwn4Ln4EXoZj/C
         hmMqrNQtxyL76hgBbkIURk9NuKZtHoZs4+l7+R4dKhfpkQ2YEj1nwX6eh7q7NCHs3wDL
         K/NB0uwlHeV7Z6bwQO0RpGhnY59K7iP4L4Ckw7YwFkwfuVocMFfrEVCqRGvMW59OPICB
         rI4w==
X-Forwarded-Encrypted: i=1; AFNElJ8Jqe00jihiXkkC1RRkNqZ3wBc89XaXIwSeTo2FETOczqSfBl/ij2/0PP/wY7cBMUTeoXnh1OY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwX89hbGUqo35HAl+GUebIUvkJs/92Ls2otIEKgSh0oqwI61mrc
	RjQ4GfBb5XHb+aPNZDiiOzXvoI64v6Iei61oyHAKbaTjRoQo+002NjJfJ90wYbu8DpSfWTYGMqH
	kRXn0F0q8cgJziABNzt59fKCIyZYuUFdYZq3bhN449lOoSOBerCSAE+ATtj/KffDT
X-Gm-Gg: Acq92OFfWcYSrRPiZ7mSiiFcS177zy95EJTPHpCBw5GlgKj5DZPc+d+RU/IPxgGWOsa
	KBsI0nXphXqQcclW/ghr2g8vH19Yf+Y/x+p6CbUApX+uVej/LRqRe5JAhNVC8Kf7dgrMyFZSxoO
	aGI2c0fu7/PQK0fvSmhuc24XpzWhTixxN5bAbVtVwfxk+4g+hRXNGIoHHn9e9T1eeGnGqNZ3oEf
	oigDEyqR3mdbG1D3x3kZ0tHAEdkc6cVWE1pPEs2eu9RJc276YnSGQ5dkvR9R0cCF8UA/7MDW+tA
	XLckFFJ8Av5/RJ1hoN/WOFWsn4/8vjeBOKmmBiRjxgYnREth0jpClkot5xGWmNp02cyb40QnEad
	lsfP3otja5S/+ukXb4g4OQ0wLz1WAc3iy4VmhuEWGsxyEp5r6V5IEUeFUO7JGGvLwXvO/U+DbBr
	G0N8MAolMxXjM=
X-Received: by 2002:a05:7022:438a:b0:128:cf5c:5356 with SMTP id a92af1059eb24-1350440ab6dmr6181740c88.5.1779112453094;
        Mon, 18 May 2026 06:54:13 -0700 (PDT)
X-Received: by 2002:a05:7022:438a:b0:128:cf5c:5356 with SMTP id a92af1059eb24-1350440ab6dmr6181706c88.5.1779112452486;
        Mon, 18 May 2026 06:54:12 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a618sm20870488c88.12.2026.05.18.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:54:11 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Matthew Leach <matthew.leach@collabora.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20260424-ath11k-null-peerid-workaround-v4-1-252b224d3cf6@collabora.com>
References: <20260424-ath11k-null-peerid-workaround-v4-1-252b224d3cf6@collabora.com>
Subject: Re: [PATCH v4] wifi: ath11k: fix peer resolution on rx path when
 peer_id=0
Message-Id: <177911245167.2671480.4093957799300242035.b4-ty@oss.qualcomm.com>
Date: Mon, 18 May 2026 06:54:11 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: iLo8mwtIBqKQiq9InjmFWEww0RAL2wPK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNiBTYWx0ZWRfXygRK9ymc/tMN
 JZAhfCY0tSHGGS3xCkB4PaIv0xDftsGOscaIefSS7icnhDUkc06A+CxG7eZmh2DK56fZlK37dy8
 awsVBo2lTmwfBqObi+PwYtDUA7LcAaj0a0H5g6qFGV/gJiCdTnNBS/DNkh12FjM9e9dIUi62gkL
 Kt+8ezAxKrNDtkHdjSMx8ZUQghJG5M3Tb8v2SNkw6G/7hPtxxj3Tem0LaLRe5r1HBZp+3eokgak
 a7DSB86uXv99sDT2qWvCdTzK1R9mCU6V+kEDlHzaD7Z4rRUY2A93TapPnu6zsMdTT0M+cbL+2Dl
 Y49Jw6Gr/L1qfE6+Io/2k5iv6phIyDsKmd1SzfxGQpUnYdFmTmMao6Acq5EgsQ//B68hG9IHj9X
 ikCNdAKSGONUVeSlSSxNbxR7nh8BfEHV4GqVudFqqmH8Fd7gewPgNkRagdLdI7iDXU3FH83PpyP
 GaUjNx3Olywcgt/V+Bw==
X-Authority-Analysis: v=2.4 cv=KZ3idwYD c=1 sm=1 tr=0 ts=6a0b1a05 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qak6Y_TGKhJDndXz1vUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: iLo8mwtIBqKQiq9InjmFWEww0RAL2wPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_065414_908596_61F25E8D 
X-CRM114-Status: GOOD (  11.31  )
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


On Fri, 24 Apr 2026 10:50:35 +0100, Matthew Leach wrote:
> It has been observed that on certain chipsets a peer can be assigned
> peer_id=0. For reception of non-aggregated MPDUs this is fine as
> ath11k_dp_rx_h_find_peer() has a fallback case where it locates the peer
> based upon the source MAC address. On an aggregated link, the mpdu_start
> header is only populated by hardware on the first sub-MSDU. This causes
> the peer resolution to be skipped for the subsequent MSDUs and the
> encryption type of these frames to be set to an incorrect value,
> resulting in these MSDUs being dropped by ieee80211.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix peer resolution on rx path when peer_id=0
      commit: 2a2451a34afdf563b3102d36a4b6cf335cf813e2

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


