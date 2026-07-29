Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA67C53219
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 16:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YirpcoPBY4rpOhTrO4fkmB31Gsil9/d9ea67eHUJDk=; b=rpebtOKurAQ2ALYBk8hEOvX4pZ
	9V1RgSJ+La+c3ii3YdjFFy+ealVsRW+myyF1RJqC6wm2Qy9pzLW+LME4A5NmJhvPeUpBDX0h1uO/I
	2XBWXUNJCwKReX+iZB/TXP5yxHzI3e8nh9dPqvgdr6lLeV3beXMuwfK0mXoWJQJSgcC/S76BiNa+0
	uKChJdLciU+jTC6Sy8uVIzGZLNu8mj5fwbqwrohUBY3R/hxkL/J2GDtSJOKu0BjNHYQPsIUHHsZBo
	A7AJWsQxGKel+lNoNLTSPt95tBvI85THp8LvIAAzKSkGyw9us0cdPMvV4D7OJIeGgBbOTdDslwa21
	42WDpvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6la-00000008UMX-2Jmt;
	Wed, 29 Jul 2026 16:04:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6lY-00000008ULW-23BB
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 16:04:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2gTf2591874
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 16:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YirpcoPBY4rpOhTrO4fkmB31Gsil9/d9ea67eHUJDk=; b=ZBtQiihhJvqK/79a
	pmymVMmL9BEOo5WjQ8K/EWHzIu+8qVyJHDsdSbLnyx5XD+lczdGDAkmziUVg3oCt
	H/1YCqR333iYJLF/esBLOrq75SUgCdcmA+JT3vA3z+z7ScOKMdLz0z71mLRAvCuP
	iDLtMbTZjiDgElowa8aljWHmrA5aPuBVNbBs/lhNiU8/DgYLTxVyIqkF92nx266h
	JwQHsBwhC8KC/R+Ky8i1F8BksTN6v1hgPR27Gn7CVhehXwHcIoKYnmhO9grKSvpr
	0P83+HpDDB/e7wpakjFmfJfeJ6CqPptRhD9LRZiyd8x9E7b8mnxsoY2bLsmaJF+H
	6IrLSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqke08jj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 16:04:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7ea29141so2648835ad.1
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 09:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785341059; cv=none;
        d=google.com; s=arc-20260327;
        b=rH2/ldH44xUSGYEf0N4b080ns3YImV1ymlJIqbe+xXISYkzp7LMpGsECo9ZDR8U+oO
         6fyyGFOeCU7/I+TRnEEyVm77d560q6rPJY9atwYgC6GXUsr7ZZbak7zAvXUMJdmXjhdC
         yG0vNpiPGzxgWa816YWNe8ejpp2GY/7BrQ1tYvxhXp5QUJ92WvjkCXHHRE6s+HqkNhoW
         sdf/aXAeDRGBcbGn2uxE3eBq23MDsRH/4rFg9tHDKZOxXcDJgBVbH8SniYnaZwCQT3b4
         auPOpOPHRReKxGZxy/bo/WycboKD8RV655cYp6I/4XqAk8xFkaCk5vWNAR1M+4f/eU9V
         sB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+YirpcoPBY4rpOhTrO4fkmB31Gsil9/d9ea67eHUJDk=;
        fh=9AJRcW+bkcVZ9KDUDuU4UBHu7iNChlYxBMbTvqpZ79M=;
        b=c+TDPVF8eTcbgFPYeiLNJ4rh4HjuxnjwcnC0gU5r3AK0W++brEHDXBfHHi3MNDCVRu
         GD07F3Z0NfhBqA1TjxxiBDqQTekmeeXCqMh5IigGWV1tbC2166qSM+cG33yLD9sa4yxL
         pO4KHd65R50vHCza3x4TVm1HSw9/Q52jntfuxQZnGCBH1sh0+qZRMYH/aUmnf0jDslnK
         GT5cLH4KYDrki5SqKqV9PiT77wcTWFhUg7qr/xdV4VGSiyFZga9x7hW+tzGmVfTdKXPa
         B+gK4VOwNn4yE3Mx7j+DVbM03WalZG9wr2zq21oCVIMvMy/mIKlQeRY0AfuQ2J/cMOK/
         qJ8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785341059; x=1785945859; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+YirpcoPBY4rpOhTrO4fkmB31Gsil9/d9ea67eHUJDk=;
        b=FmbhwNnQnIBdPijAak0sjzTiVCIO6QkZgOeTY23nvPS9NNcgZh3rk8pBszoDzH+H0+
         xIkD9bQ/pYCXuCOs0lXvrF2bKB5g8WFbCbLl4FtISI2eassLHyMqWjuSa4Wcvm1gR2mR
         /syDfJbXP1NSYuNBrjNY7MDdjFj63dXYLOnATLPcjxZAYWNO+ZGFaPMApI/gMC8UGg1K
         ZJIFWAFloZeokd81V5uErvhsZr7RrxsQ/v/rBrHRSIQVT3Btu7JsKf4ukwBIqu6qqZ0m
         c6MF02hxouzP7/tWn5PLP99ZLoErriJwXduZQtLrucROEfUz9XtjUi7jcwzdYo8GLxnr
         bnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341059; x=1785945859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YirpcoPBY4rpOhTrO4fkmB31Gsil9/d9ea67eHUJDk=;
        b=YXBWnT8ycBYOrQ21TTa4h+JXgr6eDCHtVjvrlw5b2clm1HJA3BE1jqJiXoQ5U8Bk0g
         cKONFQVJIvQi05ZXu9afsOska1Lc8q52dovtyjpDOrHxlCa/JreoAZPf2qe24s29TGJ2
         YlCwkJK6qAUokHvEodYJWevWlNqMsb2twM1QQGjrUtnYqVwglm/Q/WVT9k8Wmu0n0Qhb
         Ub99PjK//L2LlWq6uDnzDP+J3oi5kKB9x5WsibmdmJuHvLyW45B2V8MJ9TG5+dlkS5hb
         0TrPDvdnlwcpzChr40w+TO+x3fZkJaeISjJ+aQrE7x06XtNyQaFdHgeka9NqJdqvE7fC
         bedA==
X-Gm-Message-State: AOJu0YxmvpSVTmkMHzv3uuzgeYCJMGSyGuI82fuJYrwinjfvDkQX5JNE
	VQN6X6JMz8xcfQ4hnb7NiqWwV781zL8IW/wCdQ05JnyJNN8c2VCGLAPO33cK8gMXW1cQTNrZSg1
	Sopk/hQfnL9ax7fEsf+XUcYsqxnkts/EDl9FyX8MEA4TzEMKUnzdXKhfWnohp+TGb5V272ZQgv3
	qcp+G6kiM9SuGTEp+U+pTdBb5+Q/QjJkqnO4WaohE=
X-Gm-Gg: AR+sD11OTYNA2VH/gZaGM+CYRRcaRDjDr6+yIcrtEWwaqgDOdAPXG3+nxLb0op6yKDA
	V/lsq3IqJcVW1TC+dhNrxeMcHbZEIxPH91Ao2GvbzsLElw8nAMEUbetB/oVRN84rim56DO/4gGV
	RW9XvsMEG8+np6SRb4oAj+bk1VqVsJ1B6y47RfAEJ4axrUN8YlEUrGqwGve2j9BtO4bDIdHbL1k
	tPs9sLBq/ZD4f0yaA==
X-Received: by 2002:a17:902:f608:b0:2cf:ca85:57e2 with SMTP id d9443c01a7336-2d01e9b3e33mr79701865ad.1.1785341058387;
        Wed, 29 Jul 2026 09:04:18 -0700 (PDT)
X-Received: by 2002:a17:902:f608:b0:2cf:ca85:57e2 with SMTP id
 d9443c01a7336-2d01e9b3e33mr79701215ad.1.1785341057790; Wed, 29 Jul 2026
 09:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <CABkEBKaZOEh4OrZTYfFOj8QZHY8Ruxn2rcXL-axWHwK4o6MECA@mail.gmail.com>
 <20260724094226.227200-1-jtornosm@redhat.com>
In-Reply-To: <20260724094226.227200-1-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 21:34:04 +0530
X-Gm-Features: AUfX_mzOcu8W2M6mZ5O9sk34pCttGj9TQPlUjWdGWOfgGovyIkDqWdRVlqu4fPo
Message-ID: <CABkEBKZ7+Z=DL5scE7LnFQz==c3JKoUfFgfDYRf5HoLS_=fr=g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] wifi: ath11k: use queue mapping for WCN6750 ring selection
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX1wM6O0w/O/Hx
 LRdAgAhLSdVt2ZkucTykF4Jgq72YFJ33RqqmCxc+dLFhpga+7CePtcI4eT2vuhtkvXYA/A9UYYs
 LOlC7qU7Ez20ANLqN5GbAJhtn3UN2mcWRTUfTxuL0CbEygM9qYSOEDuCdQiU7bCiKXIQTo25rM0
 xsCKdN0C+Fy4Pv1kg36uEj2ruzuc4X/1dDvqVDGFkWHzNTQjowpYWIFnNoHuwf5+iuZ3CZyNZyS
 JjfCabnDAzopVeVVp9cKE/WUCkEiF6i0akHnOslMU7mPbd3Kp4KfkDOeKY9g2He4dWPyzhdaYlL
 bKGdxkuBcJBZjsbBSp1uQYSbMsvZHFRp/djzHjW7fCztI+iNW9y9hnK7UslG975qWIxzHL/pqKc
 +u/4fh5F/x/0MOJg689YUCEXbO/7mvZgbiifFJamAlcOFjhDlr1v7iR/mX6i8ZQ2kZyt98E4GSY
 gyfmsW3o0oJTc0ZgK+Q==
X-Proofpoint-GUID: XBbvjRRh9Ly41TxMPRqXUJ7PRRgKnyt8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX3Ve6FeTuzafh
 sSluF8bPGod9YZLv2CCLDR7zgC29DtV8FeF1dfuLRJfhDGgTYTPZ/pgozv+Xc4ejhBcRQmkIdw8
 EiaKn/FcuTL5mMajOuR3VXY7zZb0MPw=
X-Authority-Analysis: v=2.4 cv=ONYXGyaB c=1 sm=1 tr=0 ts=6a6a2483 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=20KFwNOVAAAA:8 a=fWcgDiPmc55ChaNYinEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: XBbvjRRh9Ly41TxMPRqXUJ7PRRgKnyt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_090420_528933_FF9197AA 
X-CRM114-Status: GOOD (  10.62  )
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

On Fri, Jul 24, 2026 at 3:12=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> Hello Tamizh,
>
> This is the same mapping already used by WCN7850 via skb_get_queue_mappin=
g().
> The patch only aligns WCN6750 with that existing approach.
>
Sure thanks for the information. Do we have throughput values with this cha=
nge?




--=20
- Tamizh.

