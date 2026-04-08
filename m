Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A61410F9963
	for <ath11k@archiver.kernel.org>; Wed,  8 Apr 2026 17:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gofqv9WBuYyuN9VxKxGkKGwTp+Gy1foUOIiV/v+fJvI=; b=BxwAAz4NYu5MqM/dcYYgkWG6fr
	B2mnl7oPOpU7KsV1rqDsSb9vgb3kz9Qu+PqRUBzmRHhM41uj1FA7fveNfSK3BNPI7jqmC8Zvc8Aho
	XQ10Fh3O/PMkQ9ux60qQrH9IYRk72n8pMXEGjZXc63P3GbLVI4o1M6tahtQ5BQBLadV0GR9vZqKZO
	ZinRdzc2Z2WwU/IB/R7/pdIpsaAz6ELX/g0mH/fvUSrcoJPiEkm+wUtPbARA4jQmcmruWwxa9BqXs
	yNVtMRE9ga0tI0in/2YfuLSLjljDgtR6S2Udepm49+XqLFFFmGBnGq31n9OQrLGpXx4L7mA4Tfd6G
	P2Mjqm8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtL-00000009CXa-05Vb;
	Wed, 08 Apr 2026 17:40:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtG-00000009CVu-1GlE
	for ath11k@lists.infradead.org;
	Wed, 08 Apr 2026 17:40:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638DFXY81259641
	for <ath11k@lists.infradead.org>; Wed, 8 Apr 2026 17:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gofqv9WBuYyuN9VxKxGkKG
	wTp+Gy1foUOIiV/v+fJvI=; b=pgCTKpW2pon0Z3JntM2ZX2JLNgSxCciidnvJn+
	wFvMIwNQLvhzjZUo+6YypRjYmu3yx8T9VTT2+Cu43mIyPkip09EwlRR4w7cix9Pa
	IdadODgN5Uo6nFX2CBjv1/LBELqktsPnP8XvA75TTWniXW3Q7nhgL02uajHkoQf3
	c68Jp6xt/lq89qA9Nn8BhuB2aZAwZzFuM4v+G6Qo537gBbr/EvfAf10Dx/Kp9EHR
	3RlzrviX3W76Qrm6z6vx4Z6JIc2Hy+0HdkBcN8vKmTMyYKqMWSgKzkUv9rgNdh1p
	9SX+ZiU627VXLGM991nf35yWWuUKGZsR6IhCVwAPcFOcjDkQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttuq38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 08 Apr 2026 17:40:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so119683a91.2
        for <ath11k@lists.infradead.org>; Wed, 08 Apr 2026 10:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775670032; x=1776274832; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gofqv9WBuYyuN9VxKxGkKGwTp+Gy1foUOIiV/v+fJvI=;
        b=SfrsztqxYVW/j4+WwdCWGAt7Zrr9wKiyYmeyC0SbPFtPnjwJ3S1bZrrIVadfmLWRrp
         pX9Fv5tDWk+tB2T6V6I+Gx7cLYt6dCJ88Afo1AT7btBcT97vvuHdQUYo98VKroFcgiI7
         ZX3MrroTh8VhhpBcSSgFgjAf/xvA7u4tpMM8iV9CHjUa6V6ih31uVVGYq7OJyd+9nOoq
         dKzbuBU/FqXLx/x8XqLOalJ+03FrfG50MNS+37gqYtUzUFxZ2LW9/KHcfQFBj8RG0BNN
         LV4wWA2R1NzQoZ0jJ1/j2zT+rojEpMGB/V26JyRHFfPpCwQDEIl6/soDsVY1fTaozYDQ
         Uj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670032; x=1776274832;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gofqv9WBuYyuN9VxKxGkKGwTp+Gy1foUOIiV/v+fJvI=;
        b=PXQaYMY83BQnN898vAqiMe97bRKt0/JX6zG1hvHhqriAmcR0a1Si6POIOmqUL16ofh
         mxjRgrkWb/CBTnHHyHczCbThzGIo36mRWWC7DrgIvnUCNZfLk+E1/5k2jutt27LQFYJ6
         ufdrgqDE/IM3eoiqW7/D58aiLwwOubDsnIAoqemU5vy2riAUlzbUh5wtdaVZlbJt25xY
         PwObcNUe9qKO4fsxeUIbC6BUVjOcFHF1GMisNEEJKnyJ+YwkgGVPODfzWVzmOC8AXDVK
         KPIksxoKzgRWXILLEM0VURNAallYZlkcF2TJ0AkCUdjqTdEutHzXtGI7QRHz2kcdzEXA
         G32g==
X-Forwarded-Encrypted: i=1; AJvYcCWqrIW19p9gR/TUE8SfgOzmdE3fRGL/vsLSFCqLnvADZCDsXFIfYGlrxvfJFgcA41H/a2HsxVw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5x/96DZ8njkyqNYGeYtVvOZ/Un3IQr9Alc+sP1+KsF4kjJYKj
	/3RRadkORqqMDnVH2FIgP6bJnZ+BP6clwWuve75mT/Tx7wOtrCMSIe/hsieUCbtUtVMJjEzK9WW
	hRwxKpPsMc9oLNMnwJpl52QJVoMN+g/AUA/4dKE4zrSxYXtAaHNQZ3h51Kq5qTwhY
X-Gm-Gg: AeBDiesEZANiE6Z1EKFNEwEKr9jYX0jQ614IniKeH1KkXElUFL7TBi96oH6n79f82tE
	xBHhoz5YfsrZeW960KPdnbTlG7O5xDq0feDVdgd4RYORGV/JPfKNxIN/LYD54WS0wtOoYuhA9Mv
	ubApgBGbZbo3q8kpdEsdSkEfYzpM6VA54aeeH+OSQOsXXGWRIsMNNWe+OuztCR8njBN5qPASr3I
	4FnXm8ba9A/FMN9NM4ggthQn6hGQV9VyKQmQni0k5pAd6RiChv+HdXR8JT866nQhMMemNSZmpja
	ifCl9PHpg/xiSqVTrNdAuGmxO4LvOGO/6NTrBSFZuRNw+iwRfObTMjk+zd6HIMChE5qO+1Fg91Z
	BmbnEPW/z8rL+7+ZJzrWjDhBCpN9KjY6BzBHEox7QdqTbqtHZHeGk3BNCkA==
X-Received: by 2002:a05:7300:a907:b0:2d1:93b8:bc81 with SMTP id 5a478bee46e88-2d40eecfdb4mr267764eec.31.1775670032048;
        Wed, 08 Apr 2026 10:40:32 -0700 (PDT)
X-Received: by 2002:a05:7300:a907:b0:2d1:93b8:bc81 with SMTP id 5a478bee46e88-2d40eecfdb4mr267742eec.31.1775670031453;
        Wed, 08 Apr 2026 10:40:31 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cef60a435dsm13465207eec.10.2026.04.08.10.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 10:40:30 -0700 (PDT)
Message-ID: <aa4cecc7-d5fc-41dc-ad36-80f010e5f426@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:40:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
Subject: pull-request: ath-next-20260408
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LgUMEpxR1MWyZ0PvFbOGj6INgeAR2oH0
X-Proofpoint-GUID: LgUMEpxR1MWyZ0PvFbOGj6INgeAR2oH0
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d69311 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=WLBL4ONXHNtVtiLGnawA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2NCBTYWx0ZWRfX70C5iTHCTCkZ
 z4nQTm7u9mb/n0gGfHqdLvc1eXKYAlq7cTcnCa6hLH54k2MF7ZMHI0TG0SXeT+5vWJZ8XUojSOp
 +vJudWkQD40BpoCcKLqoOQ4pyJZFzLlaeavQ4PYHG+1aedwdKLj1wYCfP7xTOKbd54s0oLPdEOT
 zlY5dRKyIi4psjqapdyaCUMzg6Hu61ZhCyIOfOme4I3shTcvspGWWoKuFG5MhHn9YBJu2akqs/R
 q5L/wERX23WZnrTYQXZQ3bwABtfb/ehz2QS6alfQtqNSkZbUOfzGPx+oNkY/TlzMfZmpNO2+AEv
 Wl4wwaiStJILooGztj1HDyjdYL7iVjxWQjOKZi7OWy1vAnZVJ67gUPMdD2Ol9xw15GDZT686j9n
 FERQJtNiPvYWBZrCaq3TPXPQnX9n7WA2t9T3ZvA191Q37k2nOM6oUMJUoofwYImzvM+sR09rzkL
 oOb63F4IfmetoMOiuOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_104034_449694_2B084A1E 
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

This was missing a DT review when I sent my v7.1 PR #3.
Hope to get this in the merge windows since there is an in-flight patch
that would leverage it:
https://lore.kernel.org/all/20260331-judyln-dts-v7-11-87217b15fefb@postmarketos.org/

---

The following changes since commit 8c6d03b7a249ffe85ba2bda09a2a7614c0ff03db:

  crypto: Remove michael_mic from crypto_shash API (2026-04-08 10:11:37 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260408

for you to fetch changes up to 6a7693873b20680a3c33bae0c9f9cb3185f64ade:

  wifi: ath10k: Add device-tree quirk to skip host cap QMI requests (2026-04-08 10:13:09 -0700)

----------------------------------------------------------------
ath.git patches for v7.1 (PR #4)

Add support for an ath10k device-tree quirk to skip host cap QMI requests.

----------------------------------------------------------------
Amit Pundir (2):
      dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
      wifi: ath10k: Add device-tree quirk to skip host cap QMI requests

 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml       | 11 +++++++++++
 drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
 drivers/net/wireless/ath/ath10k/snoc.c                      |  3 +++
 drivers/net/wireless/ath/ath10k/snoc.h                      |  1 +
 4 files changed, 25 insertions(+), 3 deletions(-)

