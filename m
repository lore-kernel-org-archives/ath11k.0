Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9427AFA375B
	for <ath11k@archiver.kernel.org>; Fri, 13 Sep 2024 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBlo8UM2zJ9FKI4YEVATh9ao2MuegB3AxLqnKpMSuJ4=; b=asa5ismmb05e9IFXDzgWJMb8+9
	jQUH+xbvT/gGARWXK3Q4v7vVt9DkQwUZCiIMcPK3pUSDkPS5Xh3JmE0hGzTYV71u2GaTEM1THV2fb
	AEowYzKB6tzF17x9hl0UlNQksHP4dC4gta/xkkMct/YLbFjesLMcpytgll7wt9WCO4WhoPNilUMvh
	n3TZpAAojuWXbaWnrVZ3SRBszEl44uJAN7NMNAmKgd3rkxrNyX5y4zUDDqAUuac0Z0Sq0BrrxY2lu
	ev/niD2uPXNSn/Kl64PwJL34gJTzZrDXjbSKPsjxCqRXwHx5GUsxY6r/zR8VXRInVikX8eGU5hlDS
	QpfMv7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp8Ms-0000000GP0M-0dfB;
	Fri, 13 Sep 2024 15:37:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp8Mn-0000000GOzV-1I5i
	for ath11k@lists.infradead.org;
	Fri, 13 Sep 2024 15:37:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAJvgr004962;
	Fri, 13 Sep 2024 15:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NBlo8UM2zJ9FKI4YEVATh9ao
	2MuegB3AxLqnKpMSuJ4=; b=cB0TFw2YHTHTav1s5B9esYGjY2g9/wBOQV+Gmy9a
	OakJzIlXYU9DbTNS7j0Ybk/ulz6FRBow+uTcpPKpa1AB3IXEZNyMLfo7X/8mThWm
	SUg+CEo3rfNHfIhvoqByBRTvv1O05knFGuFF/rHJCvDRTe3vSuuvcBTPZ09rTAKq
	WdO0ktOHM3RiOlz1xi8o0lryilcIu75RGOiHQwkXa7FoUFx09Yo+B/myoW1jTYbn
	f5nKEnu7VageSK11rLxIZRRZpPSduxVyF5fhXPF9abigtgAuVakAqdRAcEc0u43e
	r5xgKXWrRHXXlNtnUD+8HVdHmW9NKGUsCc2bYUKXMhDlMA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy7399qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 15:37:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DFbgWD020678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 15:37:42 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 08:37:42 -0700
Date: Fri, 13 Sep 2024 08:37:41 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kalle Valo
	<kvalo@kernel.org>,
        <ath11k@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [RFC] Qualcomm RB3 Gen2 WiFi firmware pull
Message-ID: <ZuRcRVsEI1D7Cg8h@hu-bjorande-lv.qualcomm.com>
References: <20240912092457.1887906-1-dmitry.baryshkov@linaro.org>
 <ZuOnz1QcNZUVYPZZ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJprNbt1FE-rqL_R+KVyVWHzZekTwfSYnedJYrODFtS6qbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJprNbt1FE-rqL_R+KVyVWHzZekTwfSYnedJYrODFtS6qbQ@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _AHHnNdIN0YwOk9TYBFfU682Qy7bfJsl
X-Proofpoint-GUID: _AHHnNdIN0YwOk9TYBFfU682Qy7bfJsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409130109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_083749_509987_C2347C18 
X-CRM114-Status: GOOD (  47.48  )
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

On Fri, Sep 13, 2024 at 07:12:58AM +0300, Dmitry Baryshkov wrote:
> On Fri, 13 Sept 2024 at 05:48, Bjorn Andersson
> <quic_bjorande@quicinc.com> wrote:
> >
> > On Thu, Sep 12, 2024 at 12:24:57PM +0300, Dmitry Baryshkov wrote:
> > > Hello,
> > >
> > > I'm planning to send the following pull request to linux-firmware, adding WiFi
> > > DSP firmware for the RB3 Gen2 board. However before doing that I wanted to
> > > check if it's fine with all affected maintainers.
> > >
> > > Qualcomm RB3 Gen2 board resets if it's used with the existing WCN6750 firmware,
> > > most likely because of the differences in the TZ setup. This pull request adds
> > > firmware specific to the qcm6490 / qcs6490 SoC family.
> > >
> >
> > Given that this firmware runs on the SoC, isn't it device specific? Does
> > it make sense to carry this under ath11k/, when it's expected to have
> > the same form and distribution as the other remoteproc firmware?
> 
> This is an interesting question. I think that having all WiFi-related
> firmware under athNk makes sense. For example wlanmdsp.mbn files are
> also stored under ath10k/WCN3990/ subdirs.
> So do q6 and m3 firmware files under ath11k/IPQ*/.
> 

I was under the impression that wlanmdsp.mbn (as being run in a
protection domain) had lower security/signature requirements than the
wpss.mbn.

If wpss.mbn is not vendor-signed (in a real product...) then I have no
concerns with keeping it under ath11k/

> >
> > >
> > > @Kalle, I understand that you cannot and won't fully support this firmware set.
> > > As a preparation to adding these files I moved existing files to the sc7280/
> > > subdir and pil-squashed them.  It is a generic preference to use a single MBN
> > > file instead of MDT + Bnn files. The mdt_loader detects the format without
> > > using the extension, handles the differences internally and doesn't require any
> > > changes to the driver or to the DT.  Could you please ack such a change?
> > >
> >
> > I much prefer that we switch this to the single-file version, so I'm
> > onboard with this.
> >
> > >
> > > @Bjorn, @Konrad in the past we have pushed all WPSS / WiFi firmware to ath10k
> > > and ath11k even if gets executed on the host.  I should have caught this while
> > > reviewing DT changes.  This branch uses firmware name that isn't compatible
> > > with the existing DT files.  Would you insist on adding compatibility symlink
> > > or we'd better fix the DT files?
> > >
> >
> > I think we have a limited user base of sc7280-chrome-common, so we
> > should be able to fix up the DeviceTree, and avoid the symlink.
> 
> I think we should keep the ath11k/WCN6750/hw1.0/wpss.mdt symlink,
> that's fine. I was talking about adding the qcom/qcm6490/wpss.mbn ->
> ath11k/WCN6750/hw1.0/wpss.mbn and the same for qcs6490 (just for the
> sake of existing DT files) or it's fine to fix the DT files instead
> and omit the symlink.
> 

Perhaps I'm mistaken, but does WiFi work on those boards today? I'm
inclined to just have us fix up the DT and avoid sprinkling the symlinks
all over the place.


I guess this shows that I need to start holding back on future
firmware-name entries until the linux-firmware structure is known.

> >
> > But I'd prefer Doug's ack on that.
> >
> > > ---
> > >
> > > The following changes since commit 4a0367b33aeaa7fe1255a920d0e39f825b6985c1:
> > >
> > >   Merge branch 'rtl8852b' into 'main' (2024-09-11 11:00:41 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/lumag/linux-firmware rb3gen2-wpss
> > >
> > > for you to fetch changes up to fb8c67987c89b6f33fb787dfc6ff6e5e0f317f6d:
> > >
> > >   ath11k: add device-specific firmware for QCM6490 boards (2024-09-12 11:58:57 +0300)
> > >
> > > ----------------------------------------------------------------
> > > Dmitry Baryshkov (2):
> > >       ath11k: move WCN6750 firmware to the device-specific subdir
> > >       ath11k: add device-specific firmware for QCM6490 boards
> > >
> > >  WHENCE                                             |  18 ++++++++----------
> > >  ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn              | Bin 0 -> 7734064 bytes
> >
> > qcm or qcs?
> 
> qcm6490 as the main location, qcs6490 is symlinked via WHENCE file.
> 

Ok!

Regards,
Bjorn

> >
> > Regards,
> > Bjorn
> >
> > >  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
> > >  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
> > >  12 files changed, 8 insertions(+), 10 deletions(-)
> > >  create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
> > >  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt
> 
> 
> 
> -- 
> With best wishes
> Dmitry
> 

