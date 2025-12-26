Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978D8E8FDA5
	for <ath11k@archiver.kernel.org>; Fri, 26 Dec 2025 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XZZBtHRHHx8H+AuCQZACsJWB296NqgLjtpchYRkgF0=; b=EytzTw9TlE35+4x8lAYh+BeN4E
	mWHvh5MeiOkjHfM5CRAluxpyulRwDU4z2X8pMEnBMa1UldKUfi5kyIda7LtRgjrLLUoFBSpFDpVV6
	OymiCBgj6MoXRf1FBi+KQFr8sEHcGPKaJA5MsRKBbew/h1mVFtQa15KaFUlPqhdguqpdXFrhT8Nch
	gD08RRHMTh1h2ouMljPvazKc7X7fHEazIO7PfmEtttpzp6atlbjZMt7fZnrTurmQYP+DOgLoq8tf6
	kTcgagcMZOFoW3fW+VgUc1XHz4enxGWVDDauVH8Y6PuFkTaGf64MlzH32kfINXZbSXjHzFAyCRo5f
	LCp6eB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ4Er-000000014fM-3uBd;
	Fri, 26 Dec 2025 09:36:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ4Eo-000000014eY-20I1
	for ath11k@lists.infradead.org;
	Fri, 26 Dec 2025 09:36:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bdfN164333
	for <ath11k@lists.infradead.org>; Fri, 26 Dec 2025 09:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4XZZBtHRHHx8H+AuCQZACsJWB296NqgLjtpchYRkgF0=; b=OfSbp3eiScDOT400
	rUJOTJt+bSTij+UEkle9dmROfhNOtjCN83gBzYSnet99HDuPYwgeMGrLaEFO/T7Q
	RObgqsefDKL71PNTY+sUNkf3rOJ6bTwEKnYVg3FzeJoz4npLQTaMeUWt0aBs4SnD
	zC06yipQ24oURXTQNqHIw0AhrSu66lV96h72rR3FNkjNzp8Xlclt746Vi3VClJdk
	W5ZvKDf9jJ3EzwrW/d8STTm4bEhVOVTIspOm9/inRBOx3QyJRLWH6u2fWw6gDfbL
	KUWPwLXqWXf30Oki35SmRSH+nVtoxHchN67Od3X+a4C2vMjy0vCuNwCD/m8S3kT+
	sQR7oA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8vaaatm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 26 Dec 2025 09:35:56 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6467b002cfeso8043745d50.3
        for <ath11k@lists.infradead.org>; Fri, 26 Dec 2025 01:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766741756; x=1767346556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XZZBtHRHHx8H+AuCQZACsJWB296NqgLjtpchYRkgF0=;
        b=gy6emv8QGUQM5NJNkZuTBSN4My8juAJ6lqgYB5sJQkUaNjKgEWYtCG9w08JoHX+RBo
         ffUGKudM2RkTXQUwJXVspUZzubS4vw6YIvwxyr/ZedbFutgE4kq5+AnZiP7NmAU5TtSH
         yatbT2hL6t4uPe8ZoUYKle1F9/l+C9jvGLEdOiFcx+QeAiHr9AB4NeMasmVOZvkbqbNX
         HUcm7i9F177wEZueiUUabZGytqySGP/zcbUzF5d9fnHbH1FRwpIk5ULw+ecWeCjn/PIH
         z276Iem0RBercnvnn+YPrdoySMgi+c8tOAqmxAW5FLzP38q3fLbecBbtQ7YZnX1eX6CJ
         gnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766741756; x=1767346556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4XZZBtHRHHx8H+AuCQZACsJWB296NqgLjtpchYRkgF0=;
        b=LivpaURpxNX0QHRLvcnZO+1/lDMeFWR1u/rcSHSmczk8AizOiPrEttPmw24QxdrKKv
         s72Bc9ndlZZBFetIKcLPy3U3TQpvVSZUoc378KVFgCDX4W/2rzaBaznIb8u1z1PdoXX6
         zv4KjbAO9M1ukv0+Nl27yzmJYtvDzPo7wtDImQb+DGvSwOu9LrsrxiVQw5J479hEoR/1
         eNpw+z3IBBPjQZ+OlA5205q26vvYo18Pa2Fw/Nd8XWXePI7e+P66WGpMZNlKfBnZa3qz
         /DkeMzVvx8NTdztoPz9th6+emTq9hUfD6314+R1Qsl3quqBNkvywiY/ORWKqtoSgXJU9
         MJYQ==
X-Gm-Message-State: AOJu0Yz1y55J7FsPxD6AZq2Llt+Z70tcMC1TAmPr4qKyyz0dLkYZPMKB
	Gi1Jj4VsjE32bmjlry53p5Q7j/i8Lxt0cMjtlyfi2q4w+LWi2WBdrn30GSjMN6Sxu8x2Z93av2j
	jbOBWlV75G/oX9sZQUfkyY4LKDCDOCfETzLkuh77w84YsMgTVCXPiSctXHItHWpUmXaWng7k8ap
	I8iaI5auaUpz5isG2ujQ0yy+OkX77bUdCMzQwGr98=
X-Gm-Gg: AY/fxX5pdgsvGEBQRz5n4QgB62kz+T2+0W2veF5Hl4bpW1tL2zha82HZbywWjX/dJG5
	/Bho4kSZesLrIuPWN9bJe7I2Fuqfki5gaIdeO5Cb3WWqwLahLNcJGU35BBv5lAEPIUDiwzgl64s
	TCDmroHAv3i4lyhVYDT6uyH4lbX00A7+Bqy1J4nI5QaCER/sEyR4CXVYcMHsvY8nAZH9c=
X-Received: by 2002:a05:690e:bcc:b0:645:5b0e:c91b with SMTP id 956f58d0204a3-6466a8321bcmr16916991d50.14.1766741756101;
        Fri, 26 Dec 2025 01:35:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQrpjX7hlPDPgxyI/zjSWgTKf51eEUVBCbIrACuGHsbiwk9fe89YSiTFhR2JLLXxD5i7CvV0No8uHokhiGfAs=
X-Received: by 2002:a05:690e:bcc:b0:645:5b0e:c91b with SMTP id
 956f58d0204a3-6466a8321bcmr16916980d50.14.1766741755729; Fri, 26 Dec 2025
 01:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com> <90fe1a15-9e22-468f-a1b8-3550212b78a7@oss.qualcomm.com>
In-Reply-To: <90fe1a15-9e22-468f-a1b8-3550212b78a7@oss.qualcomm.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 17:35:20 +0800
X-Gm-Features: AQt7F2qqZrewaQu5tT871_jZAdVwb24SnUc-FucDgDmNxWyB-EkJBxs3FaCj8A4
Message-ID: <CALC2J1O+g_aGT0UNhE4VvEFUmZC5RCCOXOQeBAQKRFm9TW6wBw@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 0/6] wifi: ath11k: Add single shot/periodic
 CFR capture support
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Yu Zhang <yu.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: T3wqh4ZsUmKgT7aOxvkcM7uJ5pijdZIR
X-Proofpoint-ORIG-GUID: T3wqh4ZsUmKgT7aOxvkcM7uJ5pijdZIR
X-Authority-Analysis: v=2.4 cv=WMByn3sR c=1 sm=1 tr=0 ts=694e56fc cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=xFDkkf_wISTah60zz5YA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA4OSBTYWx0ZWRfXwoAh5AT2APsr
 F2SXFUYfrSJJjK5jkSlJTWKLVZAgpA8z1VnKt3EXFYRGdqkyEIguLrbNCMwtqlj/eBOKRnrnPOM
 UJbMmdtrbePjKH+j8jHzVHUV2K9l1au/+BcW1hIY7iuaLWkNLQhkpe6IKzBytYBz8JNBG86S9A+
 ChFE4y3yKNSZkWsA405krQ0qSy4jf2EKlsLV+rf2CZ59+SLPpf5B2pZ/xIgy2BxWejp7cznx6km
 QAWj2y3ppFo4Su1cwNnU6doGmtYX4YIZMc8M4uodU3KGofYvxZUO5Eh5iLIW/X+n+xs9rA63unM
 lxQ41N+W2yIafxtaluC+qR1kq/tf8MAIoxG+YLMJ2nvvC/OT5TWWYJqxmSefb3znaAgDSKwVqEx
 WxeutdGhfr9Xuyl7Lb42IJDfEuMUCIpTr+xkWCUe9JnpzF7xymuA95CfI9q9JXuy+Db/yqaOZrf
 ZsYTWeVF1FAJO/WsCRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_013559_530256_81D22D7E 
X-CRM114-Status: GOOD (  19.73  )
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

On Fri, Dec 26, 2025 at 5:05=E2=80=AFPM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 12/23/2025 5:27 PM, Qian Zhang wrote:
> > To enable/disable cfr feature use command,
> >
> > echo <val> > /sys/kernel/debug/ieee80211/phyX/ath11k/enable_cfr
> >
> > where, val: 0 to disable CFR and 1 to enable CFR.
> >
> > To enable CFR capture for associated peers,
> >
> > echo "<val> <bw> <periodicity> <method>"
> >  >
> > /sys/kernel/debug/ieee80211/phyX/netdev\:wlanx/stations/<mac>/cfr_captu=
re
> >
> > val: 0 - stop CFR capture
> >      1 - start CFR capture
> > bw: CFR capture bandwidth
> >      0 - 20MHZ
> >      1 - 40MHZ
> >      2 - 80MHZ
> > Periodicity: Periodicity at which hardware is expceted to collect CFR
> > dump.
> >      0 - single shot capture.
> >      non zero - for Periodic captures (value should be multiple of 10
> > ms)
> > method: Method used by hardware to collect the CFR dump.
> >      0 - from the ACKs of QOS NULL packets.
> >
> > To enable CFR capture for unassociated clients,
> >
> > echo "<mac address> <val> <periodicity>"
> >  > /sys/kernel/debug/ieee80211/phyX/ath11k/cfr_unassoc
> >
> > Mac address: mac address of the client.
> > Val: 0 - start CFR capture
> >      1 - stop CFR capture
> > Periodicity: Periodicity at which hardware is expceted to collect CFR
> > dump.
> >      0 - single shot capture.
> >      non zero - for Periodic captures (value should be multiple of 10
> > ms)
> >
> > To collect the cfr dump,
> > cat /sys/kernel/debug/ieee80211/phy0/ath11k/cfr_capture0 > /tmp/cfr.bin
> >
> > Previous link:
> > https://lore.kernel.org/all/1645005922-7252-1-git-send-email-quic_vnara=
las@quicinc.com/
> >
> > Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> > Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> >
> > ---
> > Changes in v4:
> >  - Update patch 2/6
>
> Details of changes is needed! General description like 'update' here does=
 not help
> understand the diff compared with your last revision.
>
> > Changes in v3:
> >  - Update related comments.
> > Changes in v2:
> >  - Update related comments.
> > ---
> >
> > Venkateswara Naralasetty (6):
>
> The author in each individual patch is 'Qian Zhang <qian.zhang@oss.qualco=
mm.com>', please
> check them.
>

Sure! Will refine them.


> >   wifi: ath11k: Add initialization and deinitialization sequence for CF=
R
> >     module
> >   wifi: ath11k: Register debugfs for CFR configuration
> >   wifi: ath11k: Add support unassociated client CFR
> >   wifi: ath11k: Register relayfs entries for CFR dump
> >   wifi: ath11k: Register DBR event handler for CFR data
> >   wifi: ath11k: Register handler for CFR capture event
> >
> >  drivers/net/wireless/ath/ath11k/Kconfig       |   11 +
> >  drivers/net/wireless/ath/ath11k/Makefile      |    1 +
> >  drivers/net/wireless/ath/ath11k/cfr.c         | 1007 +++++++++++++++++
> >  drivers/net/wireless/ath/ath11k/cfr.h         |  302 +++++
> >  drivers/net/wireless/ath/ath11k/core.c        |   41 +-
> >  drivers/net/wireless/ath/ath11k/core.h        |   19 +-
> >  drivers/net/wireless/ath/ath11k/dbring.c      |   50 +-
> >  drivers/net/wireless/ath/ath11k/dbring.h      |    8 +-
> >  drivers/net/wireless/ath/ath11k/debug.h       |    8 +-
> >  drivers/net/wireless/ath/ath11k/debugfs_sta.c |  142 ++-
> >  drivers/net/wireless/ath/ath11k/hal.c         |    3 +-
> >  drivers/net/wireless/ath/ath11k/hw.h          |    5 +-
> >  drivers/net/wireless/ath/ath11k/mac.c         |   17 +-
> >  drivers/net/wireless/ath/ath11k/wmi.c         |  147 ++-
> >  drivers/net/wireless/ath/ath11k/wmi.h         |   97 +-
> >  15 files changed, 1832 insertions(+), 26 deletions(-)
> >  create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
> >  create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h
> >
> >
> > base-commit: 25f833fff81de4fbb9b5382806860b63768567e8
>

