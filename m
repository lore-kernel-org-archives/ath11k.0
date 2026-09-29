Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1CDC9832A
	for <ath11k@archiver.kernel.org>; Tue, 29 Sep 2026 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y3FAXes+v/ckFLFxhg6vzmhXV+ldag2L1geEzXuvTko=; b=c7DE2zQRiYDSmv5kScX6dIa5pf
	8hjzjG4fO/Kobx98ehZ9ud1pVFqiT5AMjn0NqA5trT7hl2YdWVnqIJbIqpnWo1NjrnWiHde6Qv2Df
	1Z/zLaNKwHjH124S0yAoy5SnVyPlOIKQ9fyf467CPbBv/2/htBP1+hmFH9lOrorDfuB0hsjq/EHBy
	XrYyDmh/q9fm4WhXh/HjgnzX7Cgyx9vDucJReqdQpQmPhPR9vtWj5Q7wsmSEuvVpZZUQPvk9B9buq
	KBq9AFk/1ex+LhVJjlquzLibO4uVL7McI8lxobcDTGc4Zig17igJgHJMso6bwMAyiH+6hvCoK1iGO
	9gK+nnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZHb-00000003rBl-3C1Y;
	Tue, 29 Sep 2026 14:58:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZHZ-00000003rB4-3LI3
	for ath11k@lists.infradead.org;
	Tue, 29 Sep 2026 14:58:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE5mPk128879
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 14:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y3FAXes+v/ckFLFxhg6vzm
	hXV+ldag2L1geEzXuvTko=; b=kC8tdC+O4jGkx7MBe1lGJU9fylEBoj41LNFXyy
	fFaCe7hCOkXfH8lEiLtdR08HY8xOWhAxPrNoHXhe2gTuVahIsgEXj+X1jAoli5in
	Ed/UNz66CtpcwYUNbDpyJz7syVqHlELEB+EYrGkoQABaVB1jbxaw2ZRuLdufCq2j
	jEKf5CpJi1YfyGFqFb3lT8SPp0EzLFm0FHnvECsP7Iisn9gnqTjD2i6Cnq3I0iJl
	00WH75mDgAGF2Ts/mnanwHPqxhaJFYOQVMRumX8iP+ZUM7zsVkJSBYeLHfm7Mja8
	0m/goyvW57TkwPiIyUQNNAJf4bvPGV+iKstdyXqX77GgEkzg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0eswg843-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 14:58:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso1642638eec.0
        for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790693893; x=1791298693; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y3FAXes+v/ckFLFxhg6vzmhXV+ldag2L1geEzXuvTko=;
        b=YTyuWve1aF2QzRfJipkzHzFxw/8Bd5QCIozVhgbxFgYIrGxQk0RWthbB52VRgFb/Mu
         4EF093J9xJtSIizBdL+6QxqlWp2yHlmMyguGaeu0urjymdv9i0AWZZ4fMS6tk/bSvQ5e
         5+LqRBZ+kvasNtb7EMLbd+hzxoCL3aCW2YJPuT/hSEaNOg3Oj9QF3IdNAjmfNTvsa9SJ
         rLpXwDCuokAWKdvhmAm/KPKpc6Z/RvWtlWB1nvFCf7WAosTI+BrQtG0hus37VQunG9k8
         Na6Ys1W6MrkOLgTt33/Dmhnqw+KxT1tkRSpfmXsCNMSnqq5sIa7POsHHNnHgy+0XSPrh
         G78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693893; x=1791298693;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3FAXes+v/ckFLFxhg6vzmhXV+ldag2L1geEzXuvTko=;
        b=ej6HzqU5bhiuuT5mDhVU+1R+qo6KaOgYKPBYuNr1ub6VKstA4H9Ac6A12+Hxj7MEB4
         AimaCoLB7lVijIlVvl23LMBIAcmB8OSdOeOR2WBHmiwOyvq5iDiF0MnM4Zac3ta1bd3T
         517CrkaGOXgCYcoN/wt8HFLl7tCuQVKGZrkpo/+Kw6nzQbS6fe4yf+uuJ77dtQE8m/7r
         LmA+fezLs6cXyuHZgsBadYKIcmB980ubTwCbWSEAkWcdRIVC59xbDzgDK5EGmTRBL2cp
         xyqxgATYd3YhrIIkCF7+AI3bIStUkcklu7itiTL++l7Y7ZnDCLRb/Ng2xgBE3mFrNYZv
         SpCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhpESgt2tJcX22FtKy0RoIO+1mEmVQx+nxPkwRSYFic2OAhLm/PMoIPZQsK/YntTC9Psw0OJQ=@lists.infradead.org
X-Gm-Message-State: AFuF++lqrzTU4Teue89/71xGL8E7J1I90BARfdKuemcbtlG89jrjKW0X
	4EKc/6q7rpjMc6R3Urop8h8Y/323m6fWUBAK2PyL9xUPAIyHZf+OiPFzEjbh0So+cXFi+l2ZMiQ
	fCSBmTrE4B7Kwlkq0/lYrTHvEEbxGTlRKb1xUb0NofPKTwg54IqBpvx31thIUoeKdXD7sX+oM
X-Gm-Gg: AYBFou2pJdt/811Fj+puiRVqm/fq719i0SNM9EiK6yDN3E0PIlOiu0U/yjSUFl5YO+w
	CW6zWKdZIC8en30RVmtiljICOUsq5jL/D0Fr+0Ac42jJvy3ZS9ZGVSdWn800UYXHFYwy2HUv7d2
	3H/oTrM7TueN6tIwStDVmthC1EaAwo5e9cZ14JS/VD7PFWZhxmRlU6VL4djehCzBPrLkdzhPHGJ
	i+5MSwy+eWojC2KOWkiQU03I6WU6TxpfNGyTtjVKx8sZMeZipDRLRVOghyuKUhRLT20VY9Rzv5e
	1C3qDiihvZZqvQyArIg4+9/OJEqK2qm/C5mXxqsa+UKnoLDhBp8oRZBi5EbTvJEiIEv3zclBq3U
	bqO279jdmWaHq4k1N2VqQ8MQwYjEkCuI95i4=
X-Received: by 2002:a05:7022:7f19:b0:143:342a:3d3d with SMTP id a92af1059eb24-14c18a55c48mr1297368c88.0.1790693892524;
        Tue, 29 Sep 2026 07:58:12 -0700 (PDT)
X-Received: by 2002:a05:7022:7f19:b0:143:342a:3d3d with SMTP id a92af1059eb24-14c18a55c48mr1297330c88.0.1790693891851;
        Tue, 29 Sep 2026 07:58:11 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c60c55ed9sm163937c88.2.2026.09.29.07.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:58:11 -0700 (PDT)
Message-ID: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 07:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260929
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfX5yvG3fXXdy+A
 Objtj78r8To1cHb1kq205Uotf8301jiJsef2FGIFV4ozQ7mUcNCq6nJgrnzpKu02SJwU1ozH5p4
 p9MWopssx4SUGyqQVjNSpUbK2eXsstCSD3okiQ5MqpA6GGOdCpPieFNvct5ixsZPslwO/Ncgu8W
 aMxJK7lVwngwSdwub7vvNE/+Imw1sQcnRLzybpnZQ6LFAFYnviToN2p0HvHcoY0ncxhTBEtTcFn
 w8tqJJMZNv3newJXq0uVPYF2H5iwbbiuFoYg9fMk5xbi2pFYWeNIYfsstefrraMbZkoHjOcq9VT
 7eMiDQwV87n9ZmK9FLpg25bEC6/xHjwSkWxp0mY5baqeCfVDpMAwAzZo+41LFoaMl5ikxDa7/LW
 2u4dV5oBO9o4LDYVBIFLSC25SBXQZZlTHEmC09fBfvhU61dOFekTkIzppRYDMMKXJfOLucN4//a
 2kuDzWxTsZmQaG2QDKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfX7nnkZBFS/3Rx
 ekqKKY0mJS38QnzUU2XkZq3L7YK8nheMxqcz4vlwxlAj9RsvVCDb3e/QFXnyzhrYi6Cxjv8A/Dl
 M1Lvsw6TX0Tt/0L+ST+WkQ3Sy04OMPQ=
X-Authority-Analysis: v=2.4 cv=LaWpeTfi c=1 sm=1 tr=0 ts=6abbd205 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=zv2FTJzYVlaOH1Dba7MA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: zzFZgw9-0s8HdNcj65XgTCS7vdkEhV7n
X-Proofpoint-ORIG-GUID: zzFZgw9-0s8HdNcj65XgTCS7vdkEhV7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_075813_842910_249CD5EC 
X-CRM114-Status: UNSURE (   7.61  )
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

The following changes since commit 6f63e919fe1e335b8abcb3a28bfd4804a98d875a:

  wifi: mac80211: fix slab-out-of-bounds read in ieee80211_monitor_select_queue() (2026-09-28 11:11:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260929

for you to fetch changes up to d52302171b61dbba6c9c15e80e9a5f02f1e9f95c:

  wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume (2026-09-29 07:03:58 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc6

In ath11k, fix an IRQ imbalance during suspend/resume.

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume

 drivers/net/wireless/ath/ath11k/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

