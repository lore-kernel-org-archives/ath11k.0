Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifiYB-0007vZ-J8
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 10:52:00 +0000
Date: Fri, 13 Dec 2019 13:51:49 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] ath11k: driver for Qualcomm IEEE 802.11ax devices
Message-ID: <20191213105149.r7knavfbd2xs76vv@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org

Hello Kalle Valo,

This is a semi-automatic email about new static checker warnings.

The patch d5c65159f289: "ath11k: driver for Qualcomm IEEE 802.11ax 
devices" from Nov 23, 2019, leads to the following Smatch complaint:

    drivers/net/wireless/ath/ath11k/debug.c:575 ath11k_write_simulate_fw_crash()
     error: we previously assumed 'ar' could be null (see line 549)

drivers/net/wireless/ath/ath11k/debug.c
   548			ar = pdev->ar;
   549			if (ar && ar->state == ATH11K_STATE_ON) {
                            ^^
Check for NULL

   550				radioup = 1;
   551				break;
   552			}
   553		}
   554		/* filter partial writes and invalid commands */
   555		if (*ppos != 0 || count >= sizeof(buf) || count == 0)
   556			return -EINVAL;
   557	
   558		rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
   559		if (rc < 0)
   560			return rc;
   561	
   562		/* drop the possible '\n' from the end */
   563		if (buf[*ppos - 1] == '\n')
   564			buf[*ppos - 1] = '\0';
   565	
   566		if (radioup == 0) {
   567			ret = -ENETDOWN;
   568			goto exit;
   569		}
   570	
   571		if (!strcmp(buf, "assert")) {
   572			ath11k_info(ab, "simulating firmware assert crash\n");
   573			ret = ath11k_wmi_force_fw_hang_cmd(ar,
                                                           ^^
Unchecked dereference inside function

   574							   ATH11K_WMI_FW_HANG_ASSERT_TYPE,
   575							   ATH11K_WMI_FW_HANG_DELAY);
   576		} else {
   577			ret = -EINVAL;

regards,
dan carpenter

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
