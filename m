Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181A9C624DB
	for <ath11k@archiver.kernel.org>; Thu,  3 Sep 2026 19:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eeL7lzBwTDAvHtt/OIh+AAbkDGWXDc+4IzQjWdsxnw=; b=Y/Rbl9pwLljpB0sJYrc5h8CaD7
	nf/uXqSnu1Bq1z3nUJfNYsGtJoDcOMw3FrPiSa6tne5MNqcjJXs7pWHQVJnvtqVBufdTv5tvIfDO2
	KBpKYSMqGk1uYqFCPp8b0hDZb5Ft9S41l8UJdJkZBI+9K532ldLMAXktq/EXY65lqrXg0cDYFUoQG
	UZ4M0b0BTNQFoISIOgxUILCq0jS4Ll5egK7Q+U72cEbUHJlj/qbhfUGEnERjFb/V2FF46mGA48CS8
	hNuHmFJbPniP/zvePtDGID2af3iMmrPoheLMWocxcnLo1QLNkFThfOlToqXxb8v7/wCUqK+8AFzJP
	YGB7pRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Chw-00000000QIB-2lb3;
	Thu, 03 Sep 2026 19:02:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Chu-00000000QGa-1UIe
	for ath11k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3CqI346240
	for <ath11k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1eeL7lzBwTDAvHtt/OIh+AAbkDGWXDc+4IzQjWdsxnw=; b=NmSHvHWYB+vCIRfW
	Zh65/AzBrKTVGmUnXZ0E7b4vX0XXmNjcU7yHgvLRsItKGN7J4EycM1Qi18XhTmwX
	8n4bUhNML1Npv4Pu4ngNLHatq5rZquFG82M19rKf13LOOGyjYNK/opFfLeSnPvxj
	p4VfdYpug6yD0TLqZazxqWT+K+JoEmolnvmHaINFfcilvJHp5Pn3DA2mAu0jg4Hi
	X9zm7qBK9HVLFvOJUQ/zYvpFmEYVlpkCE2MZKLXe5GbcPC5tYfTgaA/EnTACCHr8
	KU6+XEgWW0fvE/5XGPSL030wC4fbbbVokPmDIPU9YQoSwLDOPSmePryUQmxEZQc7
	6Gb6fQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdtrkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so152593a91.2
        for <ath11k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462160; x=1789066960; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1eeL7lzBwTDAvHtt/OIh+AAbkDGWXDc+4IzQjWdsxnw=;
        b=GO87ERl/sptMqNSuCGda3pvsiO2UeSe4yE1Y5t6cqzRtxge/LMR6T+SWO37pb3RT+3
         iTPA4mGbjGsreMgcshsXu/Cs/xVRbTipatsCMx5c4FTlb614mseANWxfsGgxZF2JamPr
         qiQbZj4rJXaf/Bmx52KuYurS0AeJ1t9YPJzp+hs5yhGYxqoJF1eR7y6JHqENYB1lRqQJ
         jVo9cd+UzyyfNWPT7KQyBErq/RxNLSsrcUBFqygkZVxh9pIn/FWdgvm1i8HLCOABSQ/n
         v643mMwTOqZXA0ROYUw2InJwY7qkVsWM+w4OtMuMS8K08DCaUTdCxuSZz4p1nGvbOWkO
         sHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462160; x=1789066960;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eeL7lzBwTDAvHtt/OIh+AAbkDGWXDc+4IzQjWdsxnw=;
        b=eiTrxpf8W3o0Cxd3uqvc8P7+Uqv6GHMUyX4LpytBm32F4QIDRXrbT8VSHHJuN+lCWD
         Lj0nwqH1MSuYtPC0zFNxb8peTBo/uZQzNfkqDRAV3iCEeVxZ9n9kl1l/cfL13o76SuRE
         WuYwwB92CK/CUX2M9w4m8XE/09GFldwtj36EddrTf/2YoXp7alglCbdL86Dp01d4BLW5
         r++07eCam4mvFtHukld/ZAtUhgJXA3bVZRelmdECvYGWJ5DVxJXteYJb2+DlfWQaqdxB
         ruBKD+UyAYoUbNDi59FDRCtumxQU4D6DZyhAKLsgTLpb1+GCsg85uh6t+RWhJqRsLu1Z
         XN6w==
X-Forwarded-Encrypted: i=1; AKwUvBxo0Ew4LSkQEV3ahABND2guj+BfdZIXF1NKK9DwylruMnyNOFwGDGqQ4y7aQQaWQ1kflZLExIA=@lists.infradead.org
X-Gm-Message-State: AFuF++nyZzl9taHXKH2lUKf7IUrm2wRoEMn4fb598WpATu0tsxop/734
	NcO6qDmeYP08JTTh3BuquZ3itOcdMEeyeCwvyEQVHx06i8k3W9eHFL5wjk80Gtebp3TwzUytN6u
	10gB7fsXgBcQ/Vf/DPqox0X1BjgP/u3V2z53vecm+9ToQiuo08ASlwVa8RROJzxNR
X-Gm-Gg: AYBFou0EACz8pHz3IoS0pz81qbO7ngSSvn4cvNFnwh3/BSpEPM8rsIQdu37x7/iZEb9
	hMLfueNfJdjyYY+bDiHYv7xkUGIK52yp/qcQ8L6MzfBHt5bbfzx5P3bkO6GrGVyQdA7InAiNltw
	8k1lWIr3k3RSJmwGKDS3h0fwpoxNCGrBN8Gee7KJPcza+POfnZWiWpiuuVb/BnzROm3fku3XLhw
	bLNM8it+1ysXje9NqNxpgCbkaluouYTGmvh7HqNS6SfWl9XgR1NLSAvw8lCdlYwKpmm+qcYDYd5
	jvZX0mIc1pgH3xgi/QSloaCebbm0DANY93WS/5NkPGqjQDT2JHcfJ/ZLI+CRYelxB2XYs1qDP29
	VJkI3a44Z/2yY07NrWzck6NYhZSy1DqCerjvbpPsLbq3QKDSZwoE+6BM=
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr977384a91.9.1788462160075;
        Thu, 03 Sep 2026 12:02:40 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr977271a91.9.1788462159534;
        Thu, 03 Sep 2026 12:02:39 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:37 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
        justinstitt@google.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, baochen.qiang@oss.qualcomm.com,
        stable@vger.kernel.org
In-Reply-To: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
References: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
Subject: Re: [PATCH v2] wifi: ath11k: Fix possible memory leak in
 ath11k_dp_srng_setup()
Message-Id: <178846215711.824911.14716922396673159484.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:37 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX7xlS5+UUQY2a
 58WooVwSDv4D9ItpNPKQm0KrlgnOXF+oo4z2agrt6dh5rG+bz0j7sZ81HRCvnfReIYzUHkUgG0k
 ULL4NbOsTdSG/t/BdAnGi5mAVlCltxg=
X-Proofpoint-ORIG-GUID: SYAjZeSZKwI08r5-vxub4A9OXa37szB6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXxt5fb9dsAqSa
 JtXOQp5+NzTS/5lQwE/Qso0wfrgdKWF7zuJVzt2/Tnkn3GWJyYXPI7NeaV3XLYYPRchvnyL5HLw
 aPBjI7jWBrmmbLn/ikFh5AspEzw7xaB9vUNl8SArlNAhLLw6M1Umr8Tf3NcDxXljM1oMtBQj4Bp
 qPvFrLAMyb5cydfVmFLAGsIdSxAbUdj4DkuV4t3WKaz8GQT1py5kQZhYaGh178YO7tnykh7Uaaz
 no/z/spZ8JPYtaeYmqKSmgcuqW0icup18ze5Zkq8ekMfqd3JB+V3gxTa1vswRBy4cbbZmqVws1j
 2VnZm19Im8WYs88HNEdtl3b2qJuydJvD1VRAAFW/Lq5hyFsIkcckKUNdD/RVOaQlU8L2QOLWWz8
 bjWeiMkH9pHWtjL4jZKwf6ZhYV7ap/EW/XRU9MbfrMgt2u1dnjCoRGAQVTVgqQZEe+9lnROIL/I
 iZc7bFRwhj4zlq12EJw==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a99c451 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=znwm85vKAZ7j0MCq4kIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: SYAjZeSZKwI08r5-vxub4A9OXa37szB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120242_510069_8DE51188 
X-CRM114-Status: UNSURE (   9.77  )
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


On Sat, 01 Aug 2026 17:19:09 +0530, Abdun Nihaal wrote:
> In ath11k_dp_srng_setup(), the memory allocated for
> ring->vaddr_unaligned is not freed in the error paths that follow.
> Fix that by calling ath11k_dp_srng_cleanup() in those error paths.
> 
> Compile tested only. Issue found using a prototype static analysis tool
> built on the LLVM compiler infrastructure.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Fix possible memory leak in ath11k_dp_srng_setup()
      commit: 6132d70d0890c03546f6970893fd71938efb2a2f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


