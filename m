Return-Path: <SRS0=hMZx=IQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5965C433E0
	for <ath11k@archiver.kernel.org>; Thu, 18 Mar 2021 13:14:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F7F64E86
	for <ath11k@archiver.kernel.org>; Thu, 18 Mar 2021 13:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F7F64E86
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eYBf3NTwHZGQ44zNRYk2ljX6OWiyu3b41Ifqg5Zf/n4=; b=kw078sEvC2I6PbhFYA2opdI4EU
	71tclSykzvwI7zS9BDjoS3VxDnGkH3LytweN+7bp9ifmxzjsRymipOnVfG230Ghlb5xN8T5Bcu0z9
	z6sgnYe+/3GR2KPjo88GNF7TINdxwPU/UNKqcZz4Ad46IGUMmP7A/5Je1/MY8ei3GIQTq3wzF5bfW
	QynpT+HhcXJVgdC/38JLhRADPiODAAkqqWTBZEv1cd2YcwEwiQvo0CFe6qM/DPPbKTSMDMxYZqFAg
	uo1QMPf7LCg9olY+ckmj4VAaHRXXTupia18Hf+GHSkXDN2j0NydV2M93fovqXSx2Cpo3Q+tPCNh3o
	KFGGnJWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMsTM-005LGy-1t; Thu, 18 Mar 2021 13:13:56 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMsTG-005LEF-Lj
 for ath11k@lists.infradead.org; Thu, 18 Mar 2021 13:13:53 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IDCTbp153588;
 Thu, 18 Mar 2021 13:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=sqyksj0dhPopzTl7wJTpKWRxWiebRVeERb0ufk8IRX8=;
 b=Ua0wvnzBj57yVibAf/AJ7RWeI9RbAgVwVohVjbaT92meF257o8hSPFIwsyV/pk9+BXYY
 40CcwD+SbzGBRWqYZWHFhVC4t60TT9pNf2Lq7yNqJp7kT34+HyDZiyPYJGzv+hNF9ChX
 nqAaa7fBI737rsiMUjfdNlTM24YZPKeVVxTt3jXRjFvM0EcT11EKcbl2OgFX29hRbLeW
 dds/mG2gilK/ub/IF1HyppNZbAYm4qZHdGh694EK/gBha5XF53fQcelsZ39HUhEHcZtH
 MNr9TsF6otJCN1dhW8s5Vsvlgk37Y4Dlkewvh/P1zQXAmMcV+D8uFmNjFJGQw5KMG8OS iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 378p1nyda6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 13:13:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12ID66V6027660;
 Thu, 18 Mar 2021 13:13:42 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 3797b2wqja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 13:13:41 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12IDDceo023719;
 Thu, 18 Mar 2021 13:13:39 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 18 Mar 2021 06:13:38 -0700
Date: Thu, 18 Mar 2021 16:13:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: akolli@codeaurora.org
Cc: ath11k@lists.infradead.org
Subject: [bug report] ath11k: Add qcn9074 mhi controller config
Message-ID: <YFNR+z1gab7MKkQv@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=893 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180097
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1011 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=795 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_131351_880328_F52F4C45 
X-CRM114-Status: GOOD (  12.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello Anilkumar Kolli,

The patch a233811ef600: "ath11k: Add qcn9074 mhi controller config"
from Feb 16, 2021, leads to the following static checker warning:

	drivers/net/wireless/ath/ath11k/mhi.c:357 ath11k_mhi_register()
	error: uninitialized symbol 'ath11k_mhi_config'.

drivers/net/wireless/ath/ath11k/mhi.c
   342          mhi_ctrl->iova_stop = 0xffffffff;
   343          mhi_ctrl->sbl_size = SZ_512K;
   344          mhi_ctrl->seg_len = SZ_512K;
   345          mhi_ctrl->fbc_download = true;
   346          mhi_ctrl->runtime_get = ath11k_mhi_op_runtime_get;
   347          mhi_ctrl->runtime_put = ath11k_mhi_op_runtime_put;
   348          mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
   349          mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
   350          mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
   351  
   352          if (ab->hw_rev == ATH11K_HW_QCA6390_HW20)
   353                  ath11k_mhi_config = &ath11k_mhi_config_qca6390;
   354          else if (ab->hw_rev == ATH11K_HW_QCN9074_HW10)
   355                  ath11k_mhi_config = &ath11k_mhi_config_qcn9074;

ath11k_mhi_config not initialized for other revs.  Which seem to exist
so this seems like it could be a real bug?

   356  
   357          ret = mhi_register_controller(mhi_ctrl, ath11k_mhi_config);
   358          if (ret) {
   359                  ath11k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
   360                  mhi_free_controller(mhi_ctrl);
   361                  return ret;
   362          }
   363  
   364          return 0;
   365  }

regards,
dan carpenter

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
