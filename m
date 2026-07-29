Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8235C53200
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 15:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHn3z83Z1e00LEDWQ5Z3WIqS6nbwKVZUmDm9mg4b/Ns=; b=rlLzmKggh2p+ZdBFovj126WcPm
	pA9uUOoL5z+7I6yKmVnm3I9y64awR0puLsQLAHphJ/3X1uPmJzk7snpBNI7hCHsodduTLcf1NjgEu
	U/Gwek50qnvgDulVn+wDj03gbY3iIcHgDevK7f9UAsYLjTY7jz1IXOyVfSwca8LwFFklDFRi/9zVN
	2lpSqOX8OQxlo7OGWVRqIwQjLDMAXabqIic7TAsd9eK7fXhxcF2sGE3pnIaUN0uMT1MuMsQO/isyA
	+w6KLcFFm7NFKa0sdoax7VlcHK9B0L9mksu/HfegOXzH0h+D9lX110kTCHXG8PhY10wJcHuTzZK80
	/jd9f4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6UW-00000008RgG-2S3R;
	Wed, 29 Jul 2026 15:46:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6UV-00000008RfN-0Xa8
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 15:46:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2Mox1961561
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JHn3z83Z1e00LEDWQ5Z3WIqS6nbwKVZUmDm9mg4b/Ns=; b=h9+SSUmvbHGF5rLa
	GuYjgcXFTLqARvq6F3ZUCK7U/VGvYI3bJwKvXVvaISoRBsxbhZSEaQZwBqPM5Txs
	+y3GEjKPUZ+1bqKYv/Iyyf/fSJ4Afs2myTpCGNfa0/NzZUQMO7YuEZOLPpRdwf2w
	mUAdUk6EnVfD/Jl0v7I/ingVcA20O5QdTUATKKRdOVQaaF+fyxoV+GLXCQ0kBgnw
	eEQH2Qsg9xOVHwA8TpPF18KH/XpXjIwkgJEyEBVgnOvQRVQTZK4fdwAprOVZD7SJ
	GZfGmnjhlXrk1bBqmj/ZCNlcsx/PZ/ipKFtV6QSwEg8sTJUshTDXtvtAG/8oJ0+H
	iwGNjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy9178c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc88e22f92so26186805ad.1
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340002; x=1785944802; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHn3z83Z1e00LEDWQ5Z3WIqS6nbwKVZUmDm9mg4b/Ns=;
        b=eRidX12WMYPBsXO9dj6H65mgz5UfbDrybETC/Z4JH2xsQbd23fvHEHcprpkxs79vS1
         J9dCyBqTmqCBipx8rTj8y04A2cYcH7WST1tbNnV+0VlI/xJODP62cyg0Po10B5KwQoWK
         xFFoClUzNCFlGId6Aa8yzxdq54L5NnYZFOHjU/vDl92QwYQMwkO9OAA/bSTTdGQrJ3k2
         GDoAMSMfQg8B20ebbV+hXvzxVE3xANocg7qlSe7hFa12yePj5GyrXOr0vgA8pDrTnzpF
         mmh3l2fwoMyfRN0lnLI/II4TFgYt1ERWm/Ej7Bmirh/xuXPElWMstePZmB5O9C4HnoNh
         5oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340002; x=1785944802;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHn3z83Z1e00LEDWQ5Z3WIqS6nbwKVZUmDm9mg4b/Ns=;
        b=Gz1HdwNfWpI8dSPXEZa/iOfIPsVE5HPbatyA2Urg4H+VXYHN9alAmqXgXnsU0VFilH
         bHPLIaSnQHxV6/vL4Y2L1PZX8wTUx/SN88DY6KdcMvERX6l6vGsT4RE0LpaLD3Lhb+yY
         jamlrTIBbc2z3QG6+saEf86nQiOt6uU1dYpifghjXm/xuhGXjZWSdJVx/WczbUpl2XIR
         18Cw75gQgPL7lSBhfEpSgkmHYthR7hBcUnzgDbU7v/albhwJKhY8bc7ApeR8TVwIJ9S4
         jvxzC3xmjbVQtbgNXW33M19VEw1mTuWlI4p6oHd2DWFm//v5voqgX4KXr9aUFALDkC0l
         2mXg==
X-Forwarded-Encrypted: i=1; AHgh+Rotn/swY48zhfJ4fxmzPKz2pj6lnOrdiOEm2Tn5v0fyjuWQcTFovVhspnEtEvvNaW2vvcqOHIY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb8HnueI6/WuJVcAxODPlcfO6AvY2fvmEJ8bA9hkxmF2LlYtnF
	0wqQWxzz6k24xKtrTN4XbbgPxOqW4SqeE+rKO+LIfLftuajKX87uA2qOjTLMqU11AlaTpE0TPhz
	ZdLmqRpcHM9QRIqBqMoXKUfQxvuqxAl2u9cNIQCvwuR/VPFymnUjwZCqYgPuzsvMNV8AVpIQ7
X-Gm-Gg: AR+sD111X9sDAOL84MsZvcijVqIRMKw1UxfxOm9Jf/TmjnyBuBT5GzHSQV58HX5hxyE
	9w4kuR/AFvyvTlyPzLYU56HnfgP13ERKLYimrCOFjX0wUaSt9Frj3E6BNbzZTedRwj3oTX/MQNz
	4f8ATB8ObnIfH1CUzXGleUgzuhs43mExGwf19s1R4unICEdF1EghOMdjjJ7QYzal6aC+S6qS/uk
	ICKrsa9Jku2G5ZM/vgpKPcaQ77wDJwOZCkoN+BM6h/wxQS9po/f61iTn6P32qPutf0otCRPuWj1
	gvka/fnUJxWpHJYSOjjctNuSg7aViPOd7evBWubDSbocUz6iDsLtZ2L0INCzlV5ZsLHIu3e/l7i
	gMukvKXPunk/A+Plh/4BAgCW4ndKDE+bA/3aCSga9fAU3QhmJ+10Qwyk=
X-Received: by 2002:a17:902:ce89:b0:2cf:47c4:3d1a with SMTP id d9443c01a7336-2d015b14a19mr81944625ad.3.1785340002114;
        Wed, 29 Jul 2026 08:46:42 -0700 (PDT)
X-Received: by 2002:a17:902:ce89:b0:2cf:47c4:3d1a with SMTP id d9443c01a7336-2d015b14a19mr81944205ad.3.1785340001609;
        Wed, 29 Jul 2026 08:46:41 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a76a5bsm13577185ad.35.2026.07.29.08.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:46:40 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
References: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath: Fix buffer overreads in CSA
 switch count event processing
Message-Id: <178534000034.2826154.16110623603163023219.b4-ty@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:46:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfX/DrhJh+xrprK
 zc4ptyrqwVZLL+0REK1gYdI57zRSYtGwG/Vj1tsHFCUmIAQHJflNtA5zVVviik3MMFeF7zM4yll
 hLdjMylA9ZPkporUHSMIjwgTS6Moj9I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfXx0RQSWEcAZB0
 A9QyOIKa+JGMy7BZipbO7rdl4V7t21cPoS754+WI2XJNp2PzGGud8MIgkQJzas6XqWWvZnbvVye
 fb7GbXjage/6xFglIo2xItg5v47WF3lb8vlR6GBSe5zPK1Dr4QP3gIDLpn/mJ00sxHJnVMwSZ9O
 B+1/SzxrfKJPrNfGkFCU6SuummJsOK1FS3U2ueZrJCgz+ueAZSdlwZTqR8lvgFYNBdq+trCq81k
 AMGLebPbbbQxtQTh1V6wWtZbXevEffZDvQd7ChevX6EsS4vCDcHnmPcjuhQ2B3aV58CQI/x/aBG
 Q0pI3cC+6axrqQaPDsDT9fJGy1GF8sAjmq202s8g75b46xst0bptk8kWOjSP5boWYv+HB7pacZy
 iyRsTLdmGXf9a8dkBE5G/dk7HfcE6Y7A2k+d1UjU8HiPt+p61+rOM4KFmpR0loCHbMFY8aLOlZ4
 SAjiUkxWcuLP1R19Tig==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a6a2062 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2ZIKi5-oWpO6KCP1_QMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 3gYixr0bip4vVB61A_fDTrLYd0r9sn8T
X-Proofpoint-ORIG-GUID: 3gYixr0bip4vVB61A_fDTrLYd0r9sn8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_084643_178182_AF9820C5 
X-CRM114-Status: UNSURE (   7.58  )
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


On Fri, 24 Jul 2026 08:56:12 -0700, Jeff Johnson wrote:
> Both ath11k and ath12k fail to properly sanitize the CSA switch count
> event.
> 

Applied, thanks!

[1/2] wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
      commit: 878654eb78c6aa0ff585baf1376567c775ca28ec
[2/2] wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
      commit: 208d7fdb85976a737a715b81d54efaff6703880c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


