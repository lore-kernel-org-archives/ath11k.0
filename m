Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B24F8FA90
	for <ath11k@archiver.kernel.org>; Tue, 21 Apr 2026 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIxlUghUBKiCc8deiyZT8qQwfk7BrJmVDIuLaHQJzPU=; b=lOWKK1sXpny8yQzGYmkj8bGhrx
	ukR9BuO+ToFpgCLZOALZevSiBs8qBw+EP7x4Qy1tS/wvtby4meMyLIjeT5IKpiVrKuRO9cKrkWym1
	vM3dsY1J/tRBlKsuYL0nN9zk0kfiujKsUMSIYs4Zpe6vj/x8H/eT1yqiNfzV7b+H3UNX2zQaLxfL8
	Q6RuQyG+CXJH5O7ox8HgVTlzvWeHKTZOob8XD6Du8zXreBQjC57Elmq5InpBVq0zj19Tc3J/8YKQt
	a0PQHWfLB+LslFHgmdDJKOIY2z4zaQisI1Kjr2QLlpzBBmdFmUeu6pb9R09Dzdn0TX9cDD6GcZLdY
	acF/TeQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFD6J-00000008psj-0jVX;
	Tue, 21 Apr 2026 15:33:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFD6F-00000008pqt-0czg
	for ath11k@lists.infradead.org;
	Tue, 21 Apr 2026 15:33:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LALcWg1510935
	for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 15:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yIxlUghUBKiCc8deiyZT8qQw
	fk7BrJmVDIuLaHQJzPU=; b=RXkr/ERU2gTXlqPP0N71+8Xh9h/qx33T85Pw88jm
	lLesSNNFIySLhS74zBasK9ALQN/0eXlBAdrlZ1AJ7H9XChtCVxteuw/tj22laSlH
	lOi4iD/SIt8LG/E7a0c9HvhuJ5i+33+hoMVgRZz0PFS6IxIC0uvL8u9AQm08JC3S
	Zvck8K34cvfSJ0q3mpBA9Q/DRv30EH7WPd7KRpsj6Wl7To2BUuQ6pfjX8u/1yE0K
	Y1SDAXw7rlFkPhpmtF5g2o7uTE4+J51JD4VgLyE6TAlx7/+AefqTR/IkIoFzKmBA
	Mky6cPxvbgW0VavzE84noEXdAN1x/M5b+U6InjAldgovCg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak2b35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 15:33:17 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dbc56f5290so10373413a34.0
        for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 08:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776785597; x=1777390397; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yIxlUghUBKiCc8deiyZT8qQwfk7BrJmVDIuLaHQJzPU=;
        b=PQ/HdSpK1Q6Z91yVj7jjPAE+5yZ3fx611og0Liaa5tH8G2I6xsZCsDWNYIdaAst8Y7
         wSESJ8zOUwS+Xm4SeQxJMZKfuEBXffcIE0mEWrBZlT8PgvlE/JEKz74F9nwOjb4tv0zz
         ADF9DEIHEuGkc4sJYddqKDG6SMJlZRKpbccZND9zH/3mSqMfHNV/d3hBghduud0nNuf2
         HS4PpV0nKbrsJBxhx4M9K+R0mpqc4Uxh0lH2fjaII5vsUJDCl8drMy6nAZChwTzKQpQY
         0fI3uc19vsCdU1uCQPN6tRxhGObhz/KV5G30HrM5YABeCvK9nhJq5AA+rwnVrm79pKxv
         ilPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776785597; x=1777390397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIxlUghUBKiCc8deiyZT8qQwfk7BrJmVDIuLaHQJzPU=;
        b=TklNl0/I1mxCdf9zO7tYj/6u/LtwIZDUZNVw+5TgKFNlY+fOxtLhX7dgAWG5fbEDpd
         NVnzoGcjdudEUKAObU5HhGIET9mdrKG0tLT8M7gAVlNYkJd8BUMo9twDPdb/ysaC1sbP
         g7ei8D6Rvf5MhkEkkrjWfiIYJAxAegL75CgnkH5e9G4JhA99EwTFWeIWEH5pTNJ7AXV4
         eRQijOc8lh9966xQGOfqC+APhGDvDS/Q7aiVv5YDpWBYu/D4cCtB/g/0S94RzN8bjPw7
         M9j2EJJKABTna/B08CyUXbQOF0N5Oqip0UZ2/J6wj+LvTkQb/J4br6m6AKCiBelJcI3/
         NF1w==
X-Forwarded-Encrypted: i=1; AFNElJ8don4Dj0zZ5Yo5gLIYp+1Eg8nukhDCIGCFbZPTxit4xrel2XqHooAAvNfjIn0n+Z4yO3fFCgQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZN1AXQTcen0oy2Ao/pE75fD6ekDYS34xfGxKYuOF59g9WfH8K
	NUHMHz38qPGcRjZvhqQ1NA/FG0jUSJrfyr3lFBO4OZlFT7dwUcHR6LekAbgyyF7uPvmgnPQa752
	DYKGWwTMeRx9hRAiDIIbO3gtDmfvA/aLIStXdOJcCecRQ23rMqEpvpQwLEowRkHAB
X-Gm-Gg: AeBDievOn0jViKzzkcRNS9TG6mO8JrHP6FZuDjPNYC2vEGLRY/30WYN19deyd+yreBu
	pkxgE7t6C783VFmsruVVLA89HsnYThvH8oFF/of13SfmCWKnSbEYV6pJfp6ZU6d9yWTFRk/wFb3
	0bXsGjmP/HoEQ1K8VHxnWEJMW0WXlnytTi0QaXl7uTJfFDMoXCRky+IFYUuY1N8bxaTjU4F76h+
	LxfdXU7rsQvT4BkdNPbL/nLOD+ZO2AHeeXJe03xi16XBiligZ6DAE8TcHaJJ3LqW8ph+pHl3TOA
	gSwMR+x6L8wlfXAfo2XTF4eonxwLA9DZUMkxpeofnqobJfrOWaJtHO1Y6kYNglnoE83q4xRjBvZ
	DLe7gYAVojxPoVnhuC7Sz417azn2GoNPEIyAheLa4jMpKq5EpHxGYVQ1Pi3Axk6DbKfizillAWe
	Dx6cqQ8t7SCWv3d7fBdUVhzqMXgRsLtKSRvDGl/gvDs6gEWw==
X-Received: by 2002:a05:6820:55d7:20b0:67d:f88f:d853 with SMTP id 006d021491bc7-69462e2109cmr6917208eaf.6.1776785597074;
        Tue, 21 Apr 2026 08:33:17 -0700 (PDT)
X-Received: by 2002:a05:6820:55d7:20b0:67d:f88f:d853 with SMTP id 006d021491bc7-69462e2109cmr6917190eaf.6.1776785596615;
        Tue, 21 Apr 2026 08:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm3757178e87.82.2026.04.21.08.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:33:15 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:33:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260421
Message-ID: <wxnc2oczwg3hakkjxms53qbeckmy4oncp42mnqq5t7xs7lsvdc@4mmbo74zs3e2>
References: <b581cc04-f5cd-4e99-9251-523e50623b03@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b581cc04-f5cd-4e99-9251-523e50623b03@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e798bd cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: w8BUR3_LRoZCzrmJ4_9FVbrfCZVjZUfS
X-Proofpoint-ORIG-GUID: w8BUR3_LRoZCzrmJ4_9FVbrfCZVjZUfS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NCBTYWx0ZWRfXyELpkjWpMn/1
 v9g9DCUt+5dm0jxVe8m285IWgBzjdbSXGn3dM4WBnROqK2ZpS+KQd12SJOyHZPS6EM0WiWu23ON
 JeUUg9LYUxxxgO3lIVk33sBGhIi/21ygDqBeDDjpPDZwxp8RHELFctFkASfARCzU1LsOeDt0OHe
 oHxfsXOlU/20flsJfmyfoKGCoFDs0CMrMB4cPEMY/+0KrFwmU5vYCXSYkvDD3uD0filrriXdcbB
 HhVMUxkpcGM9YPpe2KHocWVJb+7y3CX3qUuYBv8kymcaukrwRckwurpR/3W1UXN5jNcXFboGYCU
 +47JSXvpqrZjKxeSNT1DP1gyW43THaGMrJ1PiieHp6CNma/8/qp9carMq/wxjBOmbufspLMZByY
 o5bNdfAkLoGSiKxVnDLtwXvRCavAfZVqVybqpXscmGS1bGNFfqBbD2ctvG84ESCeBj1jjy3bv5M
 0WD1HnrwOervNEvfDlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_083319_340571_F7B2271E 
X-CRM114-Status: GOOD (  13.64  )
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

On Tue, Apr 21, 2026 at 07:36:08AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> For ath12k, add the initial firmware and board files for IPQ5424 and QCC2072.

Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1010

> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> ---

-- 
With best wishes
Dmitry

